import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_event.dart';
part 'dropdown_state.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  DropdownBloc() : super(DropdownState(false));

  @override
  Stream<DropdownState> mapEventToState(
    DropdownEvent event,
  ) async* {
    if (event is ToggleDropdown) {
      yield DropdownState(!state.expanded);
    }
  }
}
