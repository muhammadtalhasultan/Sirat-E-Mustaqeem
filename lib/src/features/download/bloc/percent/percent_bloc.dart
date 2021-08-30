import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'percent_event.dart';
part 'percent_state.dart';

class PercentBloc extends Bloc<PercentEvent, PercentState> {
  PercentBloc() : super(PercentState(0));

  @override
  Stream<PercentState> mapEventToState(
    PercentEvent event,
  ) async* {
    if (event is UpdatePercent) {
      yield PercentState(event.percent);
    }
  }
}
