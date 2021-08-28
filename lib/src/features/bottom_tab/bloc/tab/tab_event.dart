part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class SetTab extends TabEvent {
  const SetTab(this.index);
  final int index;

  @override
  List<Object> get props => [index];
}
