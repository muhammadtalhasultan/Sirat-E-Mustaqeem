import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appbar_event.dart';
part 'appbar_state.dart';

class AppbarBloc extends Bloc<AppbarEvent, AppbarState> {
  AppbarBloc() : super(const AppbarState(false)) {
    on<AppbarEvent>((event, emit) async {
      if (event is ToggleDisplay) {
        emit(AppbarState(!state.displayAppbar));
      }
    });
  }
}
