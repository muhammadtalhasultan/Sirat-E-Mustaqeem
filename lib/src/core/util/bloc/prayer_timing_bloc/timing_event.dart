part of 'timing_bloc.dart';

abstract class TimingEvent extends Equatable {
  const TimingEvent();
}

class RequestTiming extends TimingEvent {
  final PermissionStatus notificationEnabled;

  const RequestTiming(this.notificationEnabled);

  @override
  List<Object> get props => [notificationEnabled];
}

class RequestTimingForTomorrow extends TimingEvent {
  final PermissionStatus notificationEnabled;

  const RequestTimingForTomorrow(this.notificationEnabled);

  @override
  List<Object> get props => [notificationEnabled];
}

class UpdateTiming extends TimingEvent {
  @override
  List<Object> get props => [];
}

class PushNotification extends TimingEvent {
  @override
  List<Object> get props => [];
}

class CancelNotification extends TimingEvent {
  @override
  List<Object> get props => [];
}
