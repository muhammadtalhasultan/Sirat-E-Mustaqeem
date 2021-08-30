import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sirat_e_mustaqeem/src/core/util/model/allah_name.dart';

part 'allah_name_event.dart';
part 'allah_name_state.dart';

class AllahNameBloc extends Bloc<AllahNameEvent, AllahNameState> {
  AllahNameBloc()
      : super(
          AllahNameState(
            AllahNames(),
          ),
        );

  @override
  Stream<AllahNameState> mapEventToState(
    AllahNameEvent event,
  ) async* {
    if (event is FetchAllahName) {
      state.allahNames.initializeData(event.names);
      yield AllahNameState(state.allahNames);
    }
  }
}
