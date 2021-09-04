part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class InitLocation extends LocationEvent {
  @override
  List<Object> get props => [];
}

class SetLocation extends LocationEvent {
  final double latitude;
  final double longitude;

  SetLocation(this.latitude, this.longitude);

  @override
  List<Object> get props => [latitude, longitude];
}
