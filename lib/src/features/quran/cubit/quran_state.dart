part of 'quran_cubit.dart';

abstract class QuranState extends Equatable {
  final bool fromNav;
  const QuranState(this.fromNav);

  @override
  List<Object> get props => [fromNav];
}

class QuranInitial extends QuranState {
  const QuranInitial(bool fromNav) : super(fromNav);
}
