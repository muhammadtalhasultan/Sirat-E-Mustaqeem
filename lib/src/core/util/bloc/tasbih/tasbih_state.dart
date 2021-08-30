part of 'tasbih_bloc.dart';

class TasbihState extends Equatable {
  final Tasbihs tasbihs;
  const TasbihState(this.tasbihs);

  @override
  List<Object> get props => [tasbihs];
}
