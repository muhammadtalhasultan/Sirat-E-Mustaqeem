import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routes/routes.dart';
import '../../../core/database/database_service.dart';
import '../../../core/util/bloc/database/database_bloc.dart';

Future<void> checkDatabaseAvailability(BuildContext context) async {
  bool databaseExist = await DatabaseService().checkIfDatabaseExist();

  if (databaseExist) {
    BlocProvider.of<DatabaseBloc>(context).add(InitDatabase(context));
  } else {
    Navigator.of(context).pushReplacementNamed(RouteGenerator.download);
  }
}
