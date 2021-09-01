part of 'dropdown_bloc.dart';

abstract class DropdownEvent extends Equatable {
  const DropdownEvent();

  @override
  List<Object> get props => [];
}

class ToggleDropdown extends DropdownEvent {}
