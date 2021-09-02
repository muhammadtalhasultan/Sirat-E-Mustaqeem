part of 'quran_bloc.dart';

abstract class QuranEvent extends Equatable {
  const QuranEvent();
}

class FetchQuran extends QuranEvent {
  final List<Map<String, Object?>> datas;

  FetchQuran(this.datas);

  @override
  List<Object> get props => [datas];
}

class UpdateQuran extends QuranEvent {
  final List<Map<String, Object?>> datas;

  const UpdateQuran(this.datas);

  @override
  List<Object> get props => [datas];
}
