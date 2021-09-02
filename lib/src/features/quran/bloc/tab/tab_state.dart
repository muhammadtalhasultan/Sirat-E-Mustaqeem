part of 'tab_bloc.dart';

class TabState extends Equatable {
  final bool firstTab;
  final PageController controller;
  const TabState(this.firstTab, this.controller);

  @override
  List<Object> get props => [firstTab, controller];
}
