part of 'selected_surah_bloc.dart';

class SelectedSurahState extends Equatable {
  final Surah surah;
  final int index;
  const SelectedSurahState(this.surah, this.index);

  @override
  List<Object> get props => [surah, index];
}
