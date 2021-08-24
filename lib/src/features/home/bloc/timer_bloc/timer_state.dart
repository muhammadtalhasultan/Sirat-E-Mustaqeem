part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  final Duration difference;
  const TimerState(this.difference);

  @override
  List<Object> get props => [difference];
}

class TimerInitial extends TimerState {
  const TimerInitial(Duration difference) : super(difference);
}

class TimerLoaded extends TimerState {
  const TimerLoaded(Duration difference) : super(difference);
}
