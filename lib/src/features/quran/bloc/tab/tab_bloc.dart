import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sirat_e_mustaqeem/src/core/util/constants.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc(PageController controller) : super(TabState(true, controller));

  @override
  Stream<TabState> mapEventToState(
    TabEvent event,
  ) async* {
    if (event is ToggleTab) {
      yield TabState(event.firstTab, state.controller);
    }
  }
}
