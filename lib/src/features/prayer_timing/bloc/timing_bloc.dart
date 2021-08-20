import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sirat_e_mustaqeem/src/core/error/failures.dart';
import 'package:sirat_e_mustaqeem/src/features/prayer_timing/model/timing.dart';
import 'package:sirat_e_mustaqeem/src/features/prayer_timing/model/timing_controller.dart';

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
        yield TimingLoaded(r);
      });
    }
  }
}
