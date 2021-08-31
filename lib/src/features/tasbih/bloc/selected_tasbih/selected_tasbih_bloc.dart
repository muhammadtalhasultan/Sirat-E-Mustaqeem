import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/util/model/tasbih.dart';

part 'selected_tasbih_event.dart';
part 'selected_tasbih_state.dart';

class SelectedTasbihBloc
    extends Bloc<SelectedTasbihEvent, SelectedTasbihState> {
  SelectedTasbihBloc(Tasbih tasbih) : super(SelectedTasbihState(tasbih, 0));

  @override
  Stream<SelectedTasbihState> mapEventToState(
    SelectedTasbihEvent event,
  ) async* {
    if (event is AddCounter) {
      if (state.count < state.tasbih.counter)
        yield SelectedTasbihState(state.tasbih, state.count + 1);
    } else if (event is ResetCounter) {
      yield SelectedTasbihState(state.tasbih, 0);
    }
  }
}
