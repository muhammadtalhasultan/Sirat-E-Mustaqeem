import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../home/screen/home_screen.dart';
import '../../../setting/screen/setting_screen.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState(0, pages[0]));

  @override
  Stream<TabState> mapEventToState(
    TabEvent event,
  ) async* {
    if (event is SetTab) {
      yield TabState(
        event.index,
        pages[event.index],
      );
    }
  }
}

final List<Widget> pages = [
  HomeScreen(),
  HomeScreen(),
  HomeScreen(),
  HomeScreen(),
  SettingScreen(),
];
