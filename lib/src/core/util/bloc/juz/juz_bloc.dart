import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/juz.dart';

part 'juz_event.dart';
part 'juz_state.dart';

class JuzBloc extends Bloc<JuzEvent, JuzState> {
  JuzBloc() : super(JuzState(Juzs())) {
    on<JuzEvent>((event, emit) async {
      if (event is FetchJuz) {
        state.juzs.initializeData(event.datas);
        emit(JuzState(state.juzs));
      }
    });
  }
}
