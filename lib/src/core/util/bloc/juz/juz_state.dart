part of 'juz_bloc.dart';

class JuzState extends Equatable {
  final Juzs juzs;

  const JuzState(this.juzs);

  @override
  List<Object> get props => [juzs];
}
