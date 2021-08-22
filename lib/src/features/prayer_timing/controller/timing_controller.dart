import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/network_client.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/controller/location_controller.dart';
import '../model/timing.dart';

Future<Either<Failure, Timing>> getPrayerTiming() async {
  /// initiate apiservice class to perform get request to get prayer timing
  ApiService apiService =
      ApiService(networkClient: NetworkClient(PRAYER_TIMING_URL));

  /// get user current position through this function
  final result = await getCurrentPosition();

  Position? position;
  Failure? failure;

  /// fold the result from getCurrentPosition function either [void] or [Position] object
  result.fold(
    (l) => failure = l,
    (r) => position = r,
  );

  /// location feature is not enabled. A [Failure] is returned in this case.
  if (failure != null) {
    return Left(failure!);
  }

  /// query parameters for get request to get praying timing from api
  Map<String, Object> params = {
    'latitude': position!.latitude,
    'longitude': position!.longitude,
    'method': 4,
  };

  /// current date for getting praying timing from api
  final String date = DateTime.now().toIso8601String();

  try {
    /// returned response from the api
    Response timingResponse = await apiService.getPrayerTiming(date, params);

    /// case response is ok: [Timing] class is returned for the presentation layer.
    if (timingResponse.statusCode == 200) {
      final Timing timing = Timing.fromJson(
        timingResponse.data,
      );

      return Right(timing);
    }

    /// otherwise [Failure] is returned
    else {
      return Left(
        RemoteFailure(
            message: 'Get prayer time failed.',
            errorType: DioErrorType.response),
      );
    }
  } on RemoteException catch (e) {
    return Left(
      RemoteFailure(
        message: e.dioError.message,
        errorType: DioErrorType.response,
      ),
    );
  }
}
