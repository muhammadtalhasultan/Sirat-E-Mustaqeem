part of 'selected_juz_bloc.dart';

abstract class SelectedJuzEvent extends Equatable {
  const SelectedJuzEvent();

  @override
  List<Object> get props => [];
}

class SelectJuz extends SelectedJuzEvent {
  final int index;
  const SelectJuz(this.index);

  @override
  List<Object> get props => [index];
}
