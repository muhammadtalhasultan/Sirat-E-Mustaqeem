part of 'timing_bloc.dart';

abstract class TimingEvent extends Equatable {
  const TimingEvent();
}

class RequestTiming extends TimingEvent {
  final LocationState locationState;

  final PermissionStatus notificationEnabled;

  const RequestTiming(
    this.notificationEnabled,
    this.locationState,
  );

  @override
  List<Object> get props => [
        notificationEnabled,
        locationState,
      ];
}

class RequestTimingForTomorrow extends TimingEvent {
  final LocationState locationState;
  final PermissionStatus notificationEnabled;

  const RequestTimingForTomorrow(
    this.notificationEnabled,
    this.locationState,
  );

  @override
  List<Object> get props => [
        notificationEnabled,
        locationState,
      ];
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
