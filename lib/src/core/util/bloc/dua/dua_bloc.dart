import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sirat_e_mustaqeem/src/core/util/model/dua.dart';

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
  }
}
