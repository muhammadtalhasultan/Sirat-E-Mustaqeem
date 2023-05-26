import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/util/model/dua.dart';
import '../../../core/util/model/quran.dart';
import '../../../core/util/model/tasbih.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  Duas _duas;
  Tasbihs _tasbihs;
  Qurans _qurans;

  CategoryBloc(this._duas, this._tasbihs, this._qurans)
      : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is FindAllFavoriteItems) {
        final List<Dua> duas = _duas.getFavoritesDua;
        final List<Tasbih> tasbihs = _tasbihs.getFavoritesTasbih;
        final List<Quran> qurans = _qurans.getFavoritesQuran;

        if (duas.isEmpty && tasbihs.isEmpty && qurans.isEmpty) {
          emit(CategoryEmpty());
        } else {
          emit(CategoryDone(
            duas: duas,
            tasbihs: tasbihs,
            qurans: qurans,
          ));
        }
      }

      if (event is UpdateFavoriteItem) {
        List<Dua> duas = _duas.getFavoritesDua;
        List<Tasbih> tasbihs = _tasbihs.getFavoritesTasbih;
        List<Quran> qurans = _qurans.getFavoritesQuran;

        if (event.duas != null) {
          duas = event.duas!.getFavoritesDua;
          _duas = event.duas!;
        }

        if (event.tasbihs != null) {
          tasbihs = event.tasbihs!.getFavoritesTasbih;
          _tasbihs = event.tasbihs!;
        }
        if (event.qurans != null) {
          qurans = event.qurans!.getFavoritesQuran;
          _qurans = event.qurans!;
        }

        if (duas.isEmpty && tasbihs.isEmpty && qurans.isEmpty) {
          emit(CategoryEmpty());
        } else {
          emit(CategoryDone(
            duas: duas,
            tasbihs: tasbihs,
            qurans: qurans,
          ));
        }
      }
    });
  }
}
