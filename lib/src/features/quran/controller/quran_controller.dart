import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/database/database_service.dart';
import '../../../core/util/bloc/database/database_bloc.dart';
import '../../../core/util/bloc/quran/quran_bloc.dart';
import '../../../core/util/model/quran.dart';

Future<void> toggleQuranFavorite(BuildContext context, Quran quran) async {
  final data = await DatabaseService()
      .toggleQuranFavorite(BlocProvider.of<DatabaseBloc>(context).db!, quran);
  BlocProvider.of<QuranBloc>(context).add(UpdateQuran(data));
}
