part of 'selected_juz_bloc.dart';

class SelectedJuzState extends Equatable {
  final Juz juz;
  final int index;
  const SelectedJuzState(this.juz, this.index);

  @override
  List<Object> get props => [juz, index];
}
