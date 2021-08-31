import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/tasbih.dart';

part 'tasbih_event.dart';
part 'tasbih_state.dart';

class TasbihBloc extends Bloc<TasbihEvent, TasbihState> {
  TasbihBloc() : super(TasbihState(Tasbihs()));

  @override
  Stream<TasbihState> mapEventToState(
    TasbihEvent event,
  ) async* {
    if (event is FetchTasbih) {
      state.tasbihs.initializeData(event.datas);
      yield TasbihState(state.tasbihs);
    }
    if (event is UpdateTasbih) {
      final newTasbihs = Tasbihs();
      newTasbihs.initializeData(event.datas);
      yield TasbihState(newTasbihs);
    }
  }
}
