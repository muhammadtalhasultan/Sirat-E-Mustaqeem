part of 'angle_bloc.dart';

class AngleState extends Equatable {
  final double angle;
  final double radian;

  AngleState(this.angle, this.radian);

  @override
  List<Object> get props => [angle, radian];
}
