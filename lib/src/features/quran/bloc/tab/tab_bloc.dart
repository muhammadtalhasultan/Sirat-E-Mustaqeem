import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc(PageController controller) : super(TabState(true, controller)) {
    on<TabEvent>((event, emit) async {
      if (event is ToggleTab) {
        emit(TabState(event.firstTab, state.controller));
      }
    });
  }
}
