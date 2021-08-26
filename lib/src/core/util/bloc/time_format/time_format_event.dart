part of 'time_format_bloc.dart';

abstract class TimeFormatEvent extends Equatable {
  const TimeFormatEvent();

  @override
  List<Object> get props => [];
}

class ToggleFormat extends TimeFormatEvent {}
