part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryEmpty extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryDone extends CategoryState {
  final List<Dua> duas;
  final List<Tasbih> tasbihs;
  final List<Quran> qurans;

  CategoryDone({
    required this.duas,
    required this.tasbihs,
    required this.qurans,
  });

  @override
  List<Object> get props => [duas, tasbihs, qurans];
}
