import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/allah_name.dart';

part 'allah_name_event.dart';
part 'allah_name_state.dart';

class AllahNameBloc extends Bloc<AllahNameEvent, AllahNameState> {
  AllahNameBloc() : super(AllahNameState(AllahNames())) {
    on<AllahNameEvent>((event, emit) async {
      // emit(DownloadLoading());
      if (event is FetchAllahName) {
        state.allahNames.initializeData(event.names);
        emit(AllahNameState(state.allahNames));
      }
    });
  }
}
