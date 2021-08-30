part of 'tasbih_bloc.dart';

abstract class TasbihEvent extends Equatable {
  const TasbihEvent();

  @override
  List<Object> get props => [];
}

class FetchTasbih extends TasbihEvent {
  final List<Map<String, Object?>> datas;

  FetchTasbih(this.datas);

  @override
  List<Object> get props => [datas];
}
