import 'package:dio/dio.dart';

// Represent exceptions from Server/Remote data source.
class RemoteException implements Exception {
  DioError dioError;

  RemoteException({required this.dioError});
}

// Represent exceptions from Cache.
class LocalException implements Exception {
  String error;

  LocalException(this.error);
}

class RouteException implements Exception {
  final String message;
  RouteException(this.message);
}
