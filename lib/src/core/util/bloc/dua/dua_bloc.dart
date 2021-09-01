import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/dua.dart';

part 'dua_event.dart';
part 'dua_state.dart';

class DuaBloc extends Bloc<DuaEvent, DuaState> {
  DuaBloc()
      : super(
          DuaState(
            Duas(),
          ),
        );

  @override
  Stream<DuaState> mapEventToState(
    DuaEvent event,
  ) async* {
    if (event is FetchDua) {
      state.duas.initializeData(event.datas);
      yield DuaState(state.duas);
    }
    if (event is UpdateDua) {
      final newDuas = Duas();
      newDuas.initializeData(event.datas);
      yield DuaState(newDuas);
    }
  }
}
