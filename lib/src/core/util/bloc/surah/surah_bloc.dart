import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/surah.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  SurahBloc() : super(SurahState(Surahs())) {
    on<SurahEvent>((event, emit) async {
      if (event is FetchSurah) {
        state.surahs.initializeData(event.datas);

        emit(SurahState(state.surahs));
      }
    });
  }
}
