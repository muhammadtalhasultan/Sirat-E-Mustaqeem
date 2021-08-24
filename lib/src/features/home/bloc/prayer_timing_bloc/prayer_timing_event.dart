part of 'prayer_timing_bloc.dart';

abstract class PrayerTimingEvent extends Equatable {
  const PrayerTimingEvent();

  @override
  List<Object> get props => [];
}

class RequestTiming extends PrayerTimingEvent {}
