import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'time_format_event.dart';
part 'time_format_state.dart';

class TimeFormatBloc extends HydratedBloc<TimeFormatEvent, TimeFormatState> {
  TimeFormatBloc() : super(TimeFormatState(true));

  @override
  Stream<TimeFormatState> mapEventToState(
    TimeFormatEvent event,
  ) async* {
    if (event is ToggleFormat) {
      if (state.is24)
        yield TimeFormatState(false);
      else
        yield TimeFormatState(true);
    }
  }

  @override
  TimeFormatState? fromJson(Map<String, dynamic> json) {
    try {
      if (json['is24'] as bool) {
        return TimeFormatState(true);
      }
      return TimeFormatState(false);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(TimeFormatState state) {
    try {
      return {
        'is24': state.is24,
      };
    } catch (e) {
      return null;
    }
  }
}
