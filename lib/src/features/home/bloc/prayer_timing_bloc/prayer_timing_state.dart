part of 'prayer_timing_bloc.dart';

class PrayerTimingState extends Equatable {
  final String timing;
  final String prayer;
  const PrayerTimingState(this.prayer, this.timing);

  @override
  List<Object> get props => [prayer, timing];
}
