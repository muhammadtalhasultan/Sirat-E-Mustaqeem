import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/juz.dart';

part 'juz_event.dart';
part 'juz_state.dart';

class JuzBloc extends Bloc<JuzEvent, JuzState> {
  JuzBloc() : super(JuzState(Juzs()));

  @override
  Stream<JuzState> mapEventToState(
    JuzEvent event,
  ) async* {
    if (event is FetchJuz) {
      state.juzs.initializeData(event.datas);
      yield JuzState(state.juzs);
    }
  }
}
