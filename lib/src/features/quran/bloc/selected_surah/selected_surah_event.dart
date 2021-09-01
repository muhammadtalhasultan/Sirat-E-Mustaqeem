part of 'selected_surah_bloc.dart';

abstract class SelectedSurahEvent extends Equatable {
  const SelectedSurahEvent();
}

class SelectSurah extends SelectedSurahEvent {
  final int index;
  const SelectSurah(this.index);

  @override
  List<Object> get props => [index];
}
