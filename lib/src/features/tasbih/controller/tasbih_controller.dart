import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/database/database_service.dart';
import '../../../core/util/bloc/database/database_bloc.dart';
import '../../../core/util/bloc/tasbih/tasbih_bloc.dart';
import '../../../core/util/model/tasbih.dart';

Future<void> toggleTasbihFavorite(BuildContext context, Tasbih tasbih) async {
  final data = await DatabaseService()
      .toggleTasbihFavorite(BlocProvider.of<DatabaseBloc>(context).db!, tasbih);
  BlocProvider.of<TasbihBloc>(context).add(UpdateTasbih(data));
}

Future<void> createTasbih(
  BuildContext context,
  TextEditingController nameController,
  TextEditingController counterController,
) async {
  final datas = await DatabaseService().createTasbih(
    BlocProvider.of<DatabaseBloc>(context).db!,
    {
      'name': nameController.text,
      'counter': int.parse(counterController.text),
    },
  );
  BlocProvider.of<TasbihBloc>(context).add(UpdateTasbih(datas));

  nameController.clear();
  counterController.clear();
}

Future<void> copyTasbih(
  BuildContext context,
  Tasbih tasbih,
) async {
  final datas = await DatabaseService().createTasbih(
    BlocProvider.of<DatabaseBloc>(context).db!,
    {
      'name': tasbih.name,
      'counter': tasbih.counter,
    },
  );
  BlocProvider.of<TasbihBloc>(context).add(UpdateTasbih(datas));

  Navigator.of(context).pop();
}

Future<void> editTasbih(
  BuildContext context,
  Tasbih tasbih,
  TextEditingController nameController,
  TextEditingController counterController,
) async {
  final datas = await DatabaseService().editTasbih(
    BlocProvider.of<DatabaseBloc>(context).db!,
    tasbih,
    {
      'name': nameController.text,
      'counter': int.parse(counterController.text),
    },
  );
  BlocProvider.of<TasbihBloc>(context).add(UpdateTasbih(datas));

  nameController.clear();
  counterController.clear();
}

Future<void> deleteTasbih(BuildContext context, Tasbih tasbih) async {
  final datas = await DatabaseService().deleteTasbih(
    BlocProvider.of<DatabaseBloc>(context).db!,
    tasbih,
  );

  BlocProvider.of<TasbihBloc>(context).add(
    UpdateTasbih(datas),
  );
  Navigator.of(context).pop();
}
