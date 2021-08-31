import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'input_event.dart';
part 'input_state.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  InputBloc() : super(InputInitial());

  @override
  Stream<InputState> mapEventToState(
    InputEvent event,
  ) async* {
    if (event is SetInputError) {
      yield InputError();
    }

    if (event is SetInputCountError) {
      yield InputCountError();
    }

    if (event is SetInputNameError) {
      yield InputNameError();
    }
  }
}
