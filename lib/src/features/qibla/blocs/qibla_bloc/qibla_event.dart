part of 'qibla_bloc.dart';

abstract class QiblaEvent extends Equatable {
  const QiblaEvent();

  @override
  List<Object> get props => [];
}

class RequestQiblahDirection extends QiblaEvent {}
