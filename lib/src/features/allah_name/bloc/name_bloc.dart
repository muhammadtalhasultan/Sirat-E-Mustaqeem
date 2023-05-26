import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/util/model/allah_name.dart';

part 'name_event.dart';
part 'name_state.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  NameBloc(AllahName name) : super(NameState(name));

  // @override
  // Stream<NameState> mapEventToState(
  //   NameEvent event,
  // ) async* {}
}
