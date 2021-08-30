part of 'surah_bloc.dart';

class SurahState extends Equatable {
  final Surahs surahs;
  const SurahState(this.surahs);

  @override
  List<Object> get props => [surahs];
}
