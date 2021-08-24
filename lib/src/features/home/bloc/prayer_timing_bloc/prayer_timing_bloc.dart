import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/util/controller/timing_controller.dart';

part 'prayer_timing_event.dart';
part 'prayer_timing_state.dart';

class PrayerTimingBloc extends Bloc<PrayerTimingEvent, PrayerTimingState> {
  PrayerTimingBloc()
      : super(
          PrayerTimingState('', ''),
        );

  @override
  Stream<PrayerTimingState> mapEventToState(
    PrayerTimingEvent event,
  ) async* {
    if (event is RequestTiming) {
      var result = await getPrayerTiming();

      yield* result.fold((l) async* {
        yield PrayerTimingState('', '');
      }, (r) async* {
        final controller = TimingController(r.data.timings);

        yield PrayerTimingState(
          controller.prayer,
          controller.timing,
        );
      });
    }
  }
}
