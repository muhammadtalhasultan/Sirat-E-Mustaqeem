part of 'qibla_bloc.dart';

abstract class QiblaState extends Equatable {
  const QiblaState();
}

class QiblaInitial extends QiblaState {
  @override
  List<Object> get props => [];
}

class QiblaLoading extends QiblaState {
  @override
  List<Object> get props => [];
}

class QiblaLoaded extends QiblaState {
  final double direction;
  const QiblaLoaded(this.direction);
  @override
  List<Object> get props => [direction];
}

class QiblaFailed extends QiblaState {
  final Failure failure;
  const QiblaFailed(this.failure);
  @override
  List<Object> get props => [failure];
}
