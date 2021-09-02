import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/util/bloc/dua/dua_bloc.dart';
import '../../../core/util/bloc/quran/quran_bloc.dart';
import '../../../core/util/bloc/tasbih/tasbih_bloc.dart';
import '../bloc/category_bloc.dart';
import '../widget/bookmark_content.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CategoryBloc(
        BlocProvider.of<DuaBloc>(context).state.duas,
        BlocProvider.of<TasbihBloc>(context).state.tasbihs,
        BlocProvider.of<QuranBloc>(context).state.qurans,
      ),
      child: BookmarkContent(),
    );
  }
}
