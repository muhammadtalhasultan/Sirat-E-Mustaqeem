part of 'dua_bloc.dart';

abstract class DuaEvent extends Equatable {
  const DuaEvent();

  @override
  List<Object> get props => [];
}

class FetchDua extends DuaEvent {
  final List<Map<String, Object?>> datas;

  FetchDua(this.datas);

  @override
  List<Object> get props => [datas];
}

class UpdateDua extends DuaEvent {
  final List<Map<String, Object?>> datas;

  const UpdateDua(this.datas);

  @override
  List<Object> get props => [datas];
}
