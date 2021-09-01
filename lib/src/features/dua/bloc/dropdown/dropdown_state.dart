part of 'dropdown_bloc.dart';

class DropdownState extends Equatable {
  final bool expanded;
  const DropdownState(this.expanded);

  @override
  List<Object> get props => [expanded];
}
