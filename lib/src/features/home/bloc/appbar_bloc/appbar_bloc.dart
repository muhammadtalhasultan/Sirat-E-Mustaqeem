import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'appbar_event.dart';
part 'appbar_state.dart';

class AppbarBloc extends Bloc<AppbarEvent, AppbarState> {
  AppbarBloc() : super(AppbarState(false));

  @override
  Stream<AppbarState> mapEventToState(
    AppbarEvent event,
  ) async* {
    if (event is ToggleDisplay) {
      yield AppbarState(!state.displayAppbar);
    }
  }
}
