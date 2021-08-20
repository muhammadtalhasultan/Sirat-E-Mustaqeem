import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];

  Failure([List properties = const <dynamic>[]]) : super();
}

// Represent failures from Server/Remote data source.
class RemoteFailure extends Failure {
  final String message;
  final DioErrorType errorType;

  RemoteFailure({required this.message, required this.errorType});
}

// Represent failures from Cache.
class LocalFailure extends Failure {
  final String message;
  final int error;

  LocalFailure({required this.message, required this.error});
}
