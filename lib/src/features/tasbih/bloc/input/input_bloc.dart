import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'input_event.dart';
part 'input_state.dart';

class InputBloc extends Bloc<InputEvent, InputState> {
  InputBloc() : super(InputInitial()) {
    on<InputEvent>((event, emit) async {
      if (event is SetInputError) {
        emit(InputError());
      }

      if (event is SetInputCountError) {
        emit(InputCountError());
      }

      if (event is SetInputNameError) {
        emit(InputNameError());
      }
    });
  }
}
