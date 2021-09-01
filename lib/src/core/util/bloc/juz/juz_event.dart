part of 'juz_bloc.dart';

abstract class JuzEvent extends Equatable {
  const JuzEvent();
}

class FetchJuz extends JuzEvent {
  final List<Map<String, Object?>> datas;

  const FetchJuz(this.datas);

  @override
  List<Object> get props => [datas];
}
