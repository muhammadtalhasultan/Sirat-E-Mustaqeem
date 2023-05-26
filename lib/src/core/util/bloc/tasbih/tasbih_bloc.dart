import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/tasbih.dart';

part 'tasbih_event.dart';
part 'tasbih_state.dart';

class TasbihBloc extends Bloc<TasbihEvent, TasbihState> {
  TasbihBloc() : super(TasbihState(Tasbihs())) {
    on<TasbihEvent>((event, emit) async {
      if (event is FetchTasbih) {
        state.tasbihs.initializeData(event.datas);

        emit(TasbihState(state.tasbihs));
      }
      if (event is UpdateTasbih) {
        final newTasbihs = Tasbihs();
        newTasbihs.initializeData(event.datas);

        emit(TasbihState(newTasbihs));
      }
    });
  }
}
