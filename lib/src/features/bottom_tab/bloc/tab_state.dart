part of 'tab_bloc.dart';

class TabState extends Equatable {
  final int index;
  final Widget screen;
  const TabState(this.index, this.screen);

  @override
  List<Object> get props => [index, screen];
}
