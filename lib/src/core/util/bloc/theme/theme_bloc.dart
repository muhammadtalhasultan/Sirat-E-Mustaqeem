import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(kAppThemeData[AppTheme.Dark]!));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ToggleTheme) {
      if (state.currentTheme == kAppThemeData[AppTheme.Dark]!)
        yield ThemeState(kAppThemeData[AppTheme.Light]!);
      else if (state.currentTheme == kAppThemeData[AppTheme.Light]!)
        yield ThemeState(kAppThemeData[AppTheme.Dark]!);
    }
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    try {
      if (json['light'] as bool) {
        return ThemeState(kAppThemeData[AppTheme.Light]!);
      }
      return ThemeState(kAppThemeData[AppTheme.Dark]!);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, bool>? toJson(ThemeState state) {
    try {
      return {
        'light': state.currentTheme == kAppThemeData[AppTheme.Light]!,
      };
    } catch (e) {
      return null;
    }
  }
}
