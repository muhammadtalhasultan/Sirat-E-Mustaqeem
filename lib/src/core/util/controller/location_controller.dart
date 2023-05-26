import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:geolocator/geolocator.dart';

import '../../error/error_code.dart';
import '../../error/exceptions.dart';
import '../../error/failures.dart';
import '../../keys.dart';
import '../../network/api_service.dart';
import '../../network/network_client.dart';
import '../model/geocoding.dart';

/// Function to get current position of user
Future<Either<LocalFailure, Position>> getCurrentPosition() async {
  if (!await Geolocator.isLocationServiceEnabled()) {
    /// if user is not enabling the location service
    // await Geolocator.openLocationSettings();
    return Left(
      LocalFailure(
        message: kLocationDisable['message'],
        error: kLocationDisable['errorCode'] as int,
      ),
    );
  }

  /// get the current permission for location service
  final LocationPermission permission = await Geolocator.checkPermission();
  LocationPermission newPermission = LocationPermission.denied;

  if (permission == LocationPermission.denied && Platform.isAndroid) {
    newPermission = await Geolocator.requestPermission();

    if (newPermission == LocationPermission.deniedForever) {
      return Left(
        LocalFailure(
          message: kLocationDisableForever['message'],
          error: kLocationDisableForever['errorCode'] as int,
        ),
      );
    }
  }

  /// catch second dialog dismissed
  if (permission == LocationPermission.denied &&
      newPermission == LocationPermission.denied &&
      Platform.isAndroid) {
    return Left(
      LocalFailure(
        message: kLocationDisable['message'],
        error: kLocationDisable['errorCode'] as int,
      ),
    );
  }

  if (permission == LocationPermission.denied && Platform.isIOS) {
    /// when first time using the app or allow once
    /// prompt user to select
    newPermission = await Geolocator.requestPermission();

    if (newPermission == LocationPermission.deniedForever) {
      return Left(
        LocalFailure(
          message: kLocationDisableForever['message'],
          error: kLocationDisableForever['errorCode'] as int,
        ),
      );
    }
  }

  if (permission == LocationPermission.deniedForever && Platform.isIOS) {
    /// happen in ios only when user click on deny
    /// allow user to go to setting and enable back
    // await Geolocator.openLocationSettings();
    return Left(
      LocalFailure(
        message: kLocationDisableForever['message'],
        error: kLocationDisableForever['errorCode'] as int,
      ),
    );
  }

  final Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.medium,
  );

  return Right(position);
}

Future<void> openLocationSetting() async {
  await Geolocator.openLocationSettings();
}

Future<Either<Failure, Geocoding>> getAddress(
  double latitude,
  double longitude,
) async {
  // / initiate apiservice class to perform get request to get address
  // https://maps.google.com/maps/api/geocode
  ApiService apiService = ApiService(
      networkClient: NetworkClient('https://maps.google.com/maps/api/geocode'));

  // / query parameters for get request to get address from api
  Map<String, Object> params = {
    'latlng': '$latitude,$longitude',
    'key': kGoogleCloudApiKey,
  };

  try {
    // / returned response from the api
    Response addressResponse = await apiService.getAddress(params);

    // / case response is ok: [Geocoding] class is returned for the presentation layer.
    if (addressResponse.statusCode == 200) {
      final Geocoding geocoding = Geocoding.fromJson(
        addressResponse.data,
      );

      return Right(geocoding);
    }

    // / otherwise [Failure] is returned
    else {
      return Left(
        RemoteFailure(
            message: addressResponse.statusCode,
            errorType: DioErrorType.badResponse),
      );
    }
  } on RemoteException catch (e) {
    String? errorMessage = e.dioError.message;
    int? errorCode;
    for (final error in RemoteErrorCode.remoteErrors) {
      if (e.dioError.message!.contains(error['rawMessage'].toString())) {
        errorMessage = error['message'].toString();
        errorCode = error['errorCode'] as int;
      }
    }
    return Left(
      RemoteFailure(
        message: errorMessage,
        errorType: DioErrorType.badResponse,
        errorCode: errorCode,
      ),
    );
  }
}
