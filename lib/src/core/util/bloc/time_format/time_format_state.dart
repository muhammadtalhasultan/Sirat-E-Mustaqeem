part of 'time_format_bloc.dart';

class TimeFormatState extends Equatable {
  final bool is24;
  const TimeFormatState(this.is24);

  @override
  List<Object> get props => [is24];
}
