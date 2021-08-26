part of 'angle_bloc.dart';

abstract class AngleState extends Equatable {
  final double angle;
  final double radian;

  AngleState(this.angle, this.radian);

  @override
  List<Object> get props => [angle, radian];
}

class AngleInitial extends AngleState {
  AngleInitial(double angle, double radian) : super(angle, radian);
}

class AngleLoaded extends AngleState {
  final double qiblaDirection;
  AngleLoaded({
    required this.qiblaDirection,
    required double angle,
    required double radian,
  }) : super(angle, radian);
}

class AngleFailed extends AngleState {
  AngleFailed(double angle, double radian) : super(angle, radian);
}
