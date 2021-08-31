import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/database/database_service.dart';
import '../../../core/error/failures.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(DownloadInitial());

  @override
  Stream<DownloadState> mapEventToState(
    DownloadEvent event,
  ) async* {
    if (event is DownloadDatabase) {
      yield DownloadLoading();

      var result = await DatabaseService().downloadDatabase(event.context);

      yield* result.fold((l) async* {
        yield DownloadFailed(l);
      }, (r) async* {
        yield DownloadDone(r);
      });
    }
  }
}
