part of 'timing_bloc.dart';

abstract class TimingEvent extends Equatable {
  const TimingEvent();

  @override
  List<Object> get props => [];
}

class RequestTiming extends TimingEvent {}

class RequestTimingForTomorrow extends TimingEvent {}

class UpdateTiming extends TimingEvent {}
