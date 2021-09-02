import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/quran.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  QuranBloc() : super(QuranState(Qurans()));

  @override
  Stream<QuranState> mapEventToState(
    QuranEvent event,
  ) async* {
    if (event is FetchQuran) {
      state.qurans.initializeData(event.datas);
      yield QuranState(state.qurans);
    }
    if (event is UpdateQuran) {
      final newQurans = Qurans();
      newQurans.initializeData(event.datas);
      yield QuranState(newQurans);
    }
  }
}
