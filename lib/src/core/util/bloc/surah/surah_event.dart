part of 'surah_bloc.dart';

abstract class SurahEvent extends Equatable {
  const SurahEvent();
}

class FetchSurah extends SurahEvent {
  final List<Map<String, Object?>> datas;

  FetchSurah(this.datas);

  @override
  List<Object> get props => [datas];
}
