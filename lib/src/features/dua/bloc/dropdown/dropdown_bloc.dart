import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dropdown_event.dart';
part 'dropdown_state.dart';

class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  DropdownBloc() : super(const DropdownState(false)) {
    on<DropdownEvent>((event, emit) async {
      if (event is ToggleDropdown) {
        emit(DropdownState(!state.expanded));
      }
    });
  }
}
