import 'dart:async';

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
  DatabaseBloc() : super(DatabaseInitial());

  @override
  Stream<DatabaseState> mapEventToState(
    DatabaseEvent event,
  ) async* {
    if (event is InitDatabase) {
      final result = await DatabaseService().initService(event.context);

      yield* result.fold((l) async* {
        yield DatabaseFailed(l);
      }, (r) async* {
        _db = r;
        yield DatabaseLoaded();
      });
    }

    if (event is AddDatabase) {
      _db = event.db;
    }
  }

  Database? get db => _db;
}
