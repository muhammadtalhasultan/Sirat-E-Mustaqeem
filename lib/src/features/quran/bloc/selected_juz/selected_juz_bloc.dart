import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/util/model/juz.dart';

part 'selected_juz_event.dart';
part 'selected_juz_state.dart';

class SelectedJuzBloc extends Bloc<SelectedJuzEvent, SelectedJuzState> {
  final Juzs juzs;

  SelectedJuzBloc(this.juzs, int index)
      : super(
          SelectedJuzState(
            juzs.juzs[index],
            index,
          ),
        );

  @override
  Stream<SelectedJuzState> mapEventToState(
    SelectedJuzEvent event,
  ) async* {
    if (event is SelectJuz) {
      yield SelectedJuzState(juzs.juzs[event.index], event.index);
    }
  }
}
