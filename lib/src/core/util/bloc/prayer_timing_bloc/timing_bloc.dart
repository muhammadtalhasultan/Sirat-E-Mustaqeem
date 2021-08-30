import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/util/controller/timing_controller.dart';
import '../../../error/failures.dart';
import '../../model/timing.dart';

part 'timing_event.dart';
part 'timing_state.dart';

class TimingBloc extends Bloc<TimingEvent, TimingState> {
  /// storage for data to prevent unneccessary api call
  Timing? _timing;

  /// constructor
  TimingBloc() : super(TimingInitial());

  @override
  Stream<TimingState> mapEventToState(
    TimingEvent event,
  ) async* {
    /// normal request of api
    if (event is RequestTiming) {
      yield TimingLoading();

      var result = await getPrayerTiming();

      yield* result.fold((l) async* {
        yield TimingFailed(l);
      }, (r) async* {
        /// checking for wheather the data is outdated.
        /// For example request data during night result in
        /// the data is outdated;
        ///
        final controller = TimingController(r.data.timings);

        /// if is outdated, request new data.
        if (controller.forTomorrow) {
          var result = await getPrayerTiming(forTomorrow: true);

          yield* result.fold((l) async* {
            yield TimingFailed(l);
          }, (r) async* {
            final controller = TimingController(r.data.timings);

            await addToLocalNotification(controller.timingsList);

            _timing = r;

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

    /// if data is not yet outdated, we just update the data
    /// to the new [dataCount] from [TimingController]
    if (event is UpdateTiming) {
      print('called');
      final Timing timing = Timing(
        code: _timing!.code,
        data: _timing!.data,
        status: _timing!.status,
      );

      yield TimingLoaded(timing);
    }
  }
}
