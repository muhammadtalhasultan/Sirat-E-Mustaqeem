part of 'percent_bloc.dart';

abstract class PercentEvent extends Equatable {
  const PercentEvent();

  @override
  List<Object> get props => [];
}

class UpdatePercent extends PercentEvent {
  final double percent;

  UpdatePercent(this.percent);

  @override
  List<Object> get props => [percent];
}
