part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class FindAllFavoriteItems extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class UpdateFavoriteItem extends CategoryEvent {
  final Tasbihs? tasbihs;
  final Duas? duas;
  final Qurans? qurans;

  UpdateFavoriteItem({
    this.tasbihs,
    this.duas,
    this.qurans,
  });

  @override
  List<Object> get props => [];
}
