import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final List<int> _timing = [];

  TimerBloc(String timing) : super(TimerInitial(Duration.zero)) {
    _timing.add(int.parse(timing.split(':')[0]));
    _timing.add(int.parse(timing.split(':')[1]));
  }

  /// get the duration difference between current time and next prayer time
  Duration getDifference() {
    /// handle case when current time is over the last prayer of the day.
    int _hours = _timing[0];

    if (DateTime.now().hour > 10 && _timing[0] < 10) {
      _hours += 24;
    }

    if (DateTime.now().hour < _hours) {
      return DateTime.now().difference(
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          _hours,
          _timing[1],
        ),
      );
    } else if (DateTime.now().hour == _hours &&
        DateTime.now().minute < _timing[1]) {
      return DateTime.now().difference(
        DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          _hours,
          _timing[1],
        ),
      );
    }

    return Duration.zero;
  }

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    if (event is TimerTick) {
      final Duration duration = getDifference();

      yield TimerLoaded(
        Duration(
          hours: -duration.inHours,
          minutes: (duration.inMinutes * -1) % 60,
          seconds: (duration.inSeconds * -1) % 60,
        ),
      );
    }
  }
}
