import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failures.dart';
import '../../../core/util/controller/timing_controller.dart';
import '../model/timing.dart';

part 'timing_event.dart';
part 'timing_state.dart';

class TimingBloc extends Bloc<TimingEvent, TimingState> {
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
            await addToLocalNotification(controller.timingsList);
            yield TimingLoaded(r);
          });
        } else {
          await addToLocalNotification(controller.timingsList);
          yield TimingLoaded(r);
        }
      });
    }
  }
}
