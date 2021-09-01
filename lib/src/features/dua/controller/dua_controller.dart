import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/database/database_service.dart';
import '../../../core/util/bloc/database/database_bloc.dart';
import '../../../core/util/bloc/dua/dua_bloc.dart';
import '../../../core/util/model/dua.dart';

Future<void> toggleDuaFavorite(BuildContext context, Dua dua) async {
  final data = await DatabaseService()
      .toggleDuaFavorite(BlocProvider.of<DatabaseBloc>(context).db!, dua);
  BlocProvider.of<DuaBloc>(context).add(UpdateDua(data));
}
