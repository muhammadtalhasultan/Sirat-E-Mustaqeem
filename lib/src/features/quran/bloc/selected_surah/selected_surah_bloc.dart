import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/util/model/surah.dart';

part 'selected_surah_event.dart';
part 'selected_surah_state.dart';

class SelectedSurahBloc extends Bloc<SelectedSurahEvent, SelectedSurahState> {
  final Surahs surahs;
  SelectedSurahBloc(this.surahs, int index)
      : super(SelectedSurahState(surahs.surahs[index], index)) {
    on<SelectedSurahEvent>((event, emit) async {
      if (event is SelectSurah) {
        emit(SelectedSurahState(surahs.surahs[event.index], event.index));
      }
    });
  }
}
