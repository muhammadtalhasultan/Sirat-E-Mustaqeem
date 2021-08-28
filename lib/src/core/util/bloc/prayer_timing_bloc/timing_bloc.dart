import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sirat_e_mustaqeem/src/core/error/failures.dart';

import '../../../../core/util/controller/timing_controller.dart';
import '../../model/timing.dart';

part 'timing_event.dart';
part 'timing_state.dart';

class TimingBloc extends Bloc<TimingEvent, TimingState> {
  Timing? _timing;
  TimingBloc() : super(TimingInitial());

  @override
  Stream<TimingState> mapEventToState(
    TimingEvent event,
  ) async* {
    if (event is RequestTiming) {
      yield TimingLoading();

      var result = await getPrayerTiming();

      yield* result.fold((l) async* {
        yield TimingFailed(l);
      }, (r) async* {
        final controller = TimingController(r.data.timings);

        if (controller.forTomorrow) {
          var result = await getPrayerTiming(forTomorrow: true);

          yield* result.fold((l) async* {
            yield TimingFailed(l);
          }, (r) async* {
            final controller = TimingController(r.data.timings);

            await addToLocalNotification(controller.timingsList);

            yield TimingLoaded(r);
          });
        } else {
          await addToLocalNotification(controller.timingsList);

          _timing = r;

          yield TimingLoaded(r);
        }
      });
    }

    if (event is RequestTimingForTomorrow) {
      var result = await getPrayerTiming(forTomorrow: true);

      yield* result.fold((l) async* {
        yield TimingFailed(l);
      }, (r) async* {
        final controller = TimingController(r.data.timings);

        await addToLocalNotification(controller.timingsList);

        _timing = r;

        yield TimingLoaded(r);
      });
    }

    if (event is UpdateTiming) {
      final Timing timing = Timing(
        code: _timing!.code,
        data: _timing!.data,
        status: _timing!.status,
      );
      yield TimingLoaded(timing);
    }
  }
}
