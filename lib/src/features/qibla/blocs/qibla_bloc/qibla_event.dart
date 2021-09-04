part of 'qibla_bloc.dart';

abstract class QiblaEvent extends Equatable {
  const QiblaEvent();
}

class RequestQiblahDirection extends QiblaEvent {
  final LocationState locationState;

  const RequestQiblahDirection(this.locationState);

  @override
  List<Object> get props => [locationState];
}
