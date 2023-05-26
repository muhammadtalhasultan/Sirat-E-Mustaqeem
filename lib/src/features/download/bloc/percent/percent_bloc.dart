import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'percent_event.dart';
part 'percent_state.dart';


class PercentBloc extends Bloc<PercentEvent, PercentState> {
  PercentBloc() : super(const PercentState(0)) {
    on<UpdatePercent>((event, emit) {
      emit(PercentState(event.percent));
    });
  }
}
