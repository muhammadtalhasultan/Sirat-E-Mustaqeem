import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/download/bloc/percent/percent_bloc.dart';
import '../error/error_code.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';
import '../network/network_client.dart';
import '../util/constants.dart';
import 'database_table.dart';

class DatabaseService {
  Future<bool> checkIfDatabaseExist() async {
    final databasesPath = await getDatabasesPath();
    final pathName = '$databasesPath/$DATABASE_FILE';

    return await File(pathName).exists();
  }

  Future<Either<LocalFailure, void>> initService(BuildContext context) async {
    try {
      final databasesPath = await getDatabasesPath();
      final pathName = '$databasesPath/$DATABASE_FILE';

      final db = await openDatabase(pathName);

      await DatabaseTable.cachedDataFromDb(db, context);

      return Right(null);
    } on LocalException catch (e) {
      return Left(
        LocalFailure(
          message: kReadDatabaseFailed['message'],
          error: kReadDatabaseFailed['errorCode'] as int,
          extraInfo: e.error,
        ),
      );
    } catch (e) {
      return Left(
        LocalFailure(
          message: kReadDatabaseFailed['message'],
          error: kReadDatabaseFailed['errorCode'] as int,
          extraInfo: e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, void>> downloadDatabase(BuildContext context) async {
    final databasesPath = await getDatabasesPath();
    final pathName = '$databasesPath/$DATABASE_FILE';

    try {
      final response = await NetworkClient(DATABASE_URL).download(
        'main/siratemustaqeem-db.db',
        pathName,
        (received, total) {
          if (total != -1) {
            final progress = received / total * 100;
            BlocProvider.of<PercentBloc>(context).add(
              UpdatePercent(progress),
            );
          }
        },
      );

      if (response.statusCode == 200) {
        var result = await initService(context);

        LocalFailure? localFailure;

        result.fold(
          (l) => localFailure = l,
          (r) => Right(null),
        );

        if (localFailure != null) {
          return Left(localFailure!);
        }
        return Right(null);
      } else {
        return Left(
          RemoteFailure(
              message: response.statusCode, errorType: DioErrorType.response),
        );
      }
    } on RemoteException catch (e) {
      String errorMessage = e.dioError.message;
      int? errorCode;
      for (final error in RemoteErrorCode.remoteErrors) {
        if (e.dioError.message.contains(error['rawMessage'].toString())) {
          errorMessage = error['message'].toString();
          errorCode = error['errorCode'] as int;
        }
      }
      return Left(
        RemoteFailure(
          message: errorMessage,
          errorType: DioErrorType.response,
          errorCode: errorCode,
        ),
      );
    }
  }
}
