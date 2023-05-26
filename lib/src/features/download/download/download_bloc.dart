import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/database/database_service.dart';
import '../../../core/error/failures.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(DownloadInitial()) {
    on<DownloadDatabase>((event, emit) async {
      emit(DownloadLoading());

      final result = await DatabaseService().downloadDatabase(event.context);

      result.fold(
        (l) => emit(DownloadFailed(l)),
        (r) => emit(DownloadDone(r)),
      );
    });
  }
}
