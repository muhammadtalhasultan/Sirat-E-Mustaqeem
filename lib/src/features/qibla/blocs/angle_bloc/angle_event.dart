part of 'angle_bloc.dart';

abstract class AngleEvent extends Equatable {
  const AngleEvent();
}

class SetMagnetometerValue extends AngleEvent {
  final List<MagnetometerEvent> events;
  const SetMagnetometerValue(this.events);
  @override
  List<Object> get props => [events];
}

class NotifyFailure extends AngleEvent {
  @override
  List<Object> get props => [events];
}
