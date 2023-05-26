import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../../database/database_service.dart';
import '../../../error/failures.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  Database? _db;
  DatabaseBloc() : super(DatabaseInitial()) {
    on<DatabaseEvent>((event, emit) async {
      if (event is InitDatabase) {
        final result = await DatabaseService().initService(event.context);

        result.fold(
          (l) => emit(DatabaseFailed(l)),
          (r) {
            _db = r;
            emit(DatabaseLoaded());
          },
        );
      }
    });
  }
  Database? get db => _db;
}
