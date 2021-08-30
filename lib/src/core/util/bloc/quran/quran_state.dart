part of 'quran_bloc.dart';

class QuranState extends Equatable {
  final Qurans qurans;
  const QuranState(this.qurans);

  @override
  List<Object> get props => [qurans];
}
