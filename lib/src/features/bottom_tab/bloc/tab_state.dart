part of 'tab_bloc.dart';

class TabState extends Equatable {
  final int index;
  const TabState(this.index);

  @override
  List<Object> get props => [index];
}
