part of 'tasbih_bloc.dart';

abstract class TasbihEvent extends Equatable {
  const TasbihEvent();

  @override
  List<Object> get props => [];
}

class FetchTasbih extends TasbihEvent {
  final List<Map<String, Object?>> datas;

  const FetchTasbih(this.datas);

  @override
  List<Object> get props => [datas];
}

class UpdateTasbih extends TasbihEvent {
  final List<Map<String, Object?>> datas;

  const UpdateTasbih(this.datas);

  @override
  List<Object> get props => [datas];
}
