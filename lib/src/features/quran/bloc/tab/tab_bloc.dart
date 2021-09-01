import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState(true));

  @override
  Stream<TabState> mapEventToState(
    TabEvent event,
  ) async* {
    if (event is ToggleTab) {
      yield TabState(!state.firstTab);
    }
  }
}
