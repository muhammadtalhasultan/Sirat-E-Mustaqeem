import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sirat_e_mustaqeem/src/core/error/error_code.dart';

import '../../error/failures.dart';

/// Function to get current position of user
Future<Either<Failure, Position>> getCurrentPosition() async {
  if (!await Geolocator.isLocationServiceEnabled()) {
    /// if user is not enabling the location service
    await Geolocator.openLocationSettings();
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

    if (newPermission == LocationPermission.deniedForever && Platform.isIOS) {
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
    await Geolocator.openLocationSettings();
    return Left(
      LocalFailure(
        message: kLocationDisableForever['message'],
        error: kLocationDisableForever['errorCode'] as int,
      ),
    );
  }

  return Right(
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    ),
  );
}

Future<void> openAppSetting() async {
  await Geolocator.openAppSettings();
}
