import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(bool fromNav) : super(QuranInitial(fromNav));
}
