part of 'tab_bloc.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();

  @override
  List<Object> get props => [];
}

class ToggleTab extends TabEvent {}
