import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/network_client.dart';
import '../../../core/util/constants.dart';
import 'timing.dart';

Future<Either<Failure, Timing>> getPrayerTiming() async {
  /// initiate apiservice class to perform get request to get prayer timing
  ApiService apiService =
      ApiService(networkClient: NetworkClient(PRAYER_TIMING_URL));

  /// get user current position through this function
  final result = await getCurrentPosition();

  Position? position;

  /// fold the result from getCurrentPosition function either [void] or [Position] object
  result.fold(
    (l) => null,
    (r) => position = r,
  );

  /// if void is returned, location feature is not enabled. A [Failure] is returned in this case.
  if (position == null) {
    return Left(
      LocalFailure(
        message: 'Location is not enabled',
        error: 1,
      ),
    );
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
  } on RemoteException {
    return Left(
      RemoteFailure(
        message: 'Get prayer time failed.',
        errorType: DioErrorType.response,
      ),
    );
  }
}

/// Function to get current position of user
Future<Either<void, Position>> getCurrentPosition() async {
  if (!await Geolocator.isLocationServiceEnabled()) {
    /// if user is not enabling the location service
    await Geolocator.openLocationSettings();
    return Left(null);
  }

  /// get the current permission for location service
  final LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    /// when first time using the app or allow once
    /// prompt user to select
    await Geolocator.requestPermission();
  }
  if (permission == LocationPermission.deniedForever && Platform.isIOS) {
    /// happen in ios only when user click on deny
    /// allow user to go to setting and enable back
    await Geolocator.openLocationSettings();
    return Left(null);
  }

  return Right(
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    ),
  );
}
