import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Represent failures from Server/Remote data source.
class RemoteFailure extends Failure {
  final DioErrorType errorType;
  final int? errorCode;

  RemoteFailure({this.errorCode, required message, required this.errorType})
      : super(message);

  @override
  List<Object> get props => [errorType];
}

// Represent failures from Cache.
class LocalFailure extends Failure {
  final int error;
  final String? extraInfo;

  LocalFailure({
    required message,
    required this.error,
    this.extraInfo,
  }) : super(message);

  @override
  List<Object> get props => [error];
}
