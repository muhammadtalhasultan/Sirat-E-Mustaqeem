/// Haversine formula is used to calculate the brearing and distance
/// for user current position with Kaaba position on Earth
/// [distance]
/// FORMULA: a = sin²(Δφ/2) + cos φ1 ⋅ cos φ2 ⋅ sin²(Δλ/2)
///          c = 2 ⋅ atan2( √a, √(1−a) )
///          d = R ⋅ c
///          where	φ is latitude, λ is longitude, R is earth’s radius (mean radius = 6,371km);
///          note that angles need to be in radians to pass to trig functions!
/// [bearing]
/// FORMULA: θ = atan2( sin Δλ ⋅ cos φ2 , cos φ1 ⋅ sin φ2 − sin φ1 ⋅ cos φ2 ⋅ cos Δλ )
/// where	φ1,λ1 is the start point, φ2,λ2 the end point (Δλ is the difference in longitude)
///
/// KAABA Position lat: 21.4224779, lng: 39.8251832
///
/// Compass Bearing 0 deg being north 90 deg being east and so on
///
import 'dart:math' show sin, cos, atan2, pi;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:vector_math/vector_math.dart' show radians;

import '../blocs/angle_bloc/angle_bloc.dart';

/// calculate the [bearing] towards Kaaba from user location.
/// Angle is 0 to 360 (from north>east>south>west)
/// will use the formula state from the description above
///
/// fix point for Kaaba Latitude and Longitude
final kaabaLat = radians(21.4224779);
final kaabaLng = radians(39.8251832);

double calculateDirection(double latitude, double longitude) {
  final userLat = radians(latitude);
  final userLng = radians(longitude);

  // final userLat = radians(5.4395021);
  // final userLng = radians(100.4287595);

  final sinDiffLng = sin(kaabaLng - userLng);
  final cosLatEnd = cos(kaabaLat);
  final cosLatStart = cos(userLat);
  final sinLatEnd = sin(kaabaLat);
  final sinLatStart = sin(userLat);
  final cosDiffLng = cos(kaabaLng - userLng);

  final angleinRad = atan2(
    sinDiffLng * cosLatEnd,
    (cosLatStart * sinLatEnd - sinLatStart * cosLatEnd * cosDiffLng),
  );

  final angleinDeg = (angleinRad * 180 / pi + 360) % 360;

  return angleinDeg;
}

/// method to filter the magnetometer sensor data as there are too
/// many noises from the data set. [Simple moving average filter] is
/// used to filter out the data. The window is set to [20](try and error
/// to get this value). Averaging the data is done on [getCompassAngle] function.
final int window = 20;
int count = 0;
List<MagnetometerEvent> events = [];

void updateEvent(MagnetometerEvent event, BuildContext context) {
  {
    events.add(event);

    BlocProvider.of<AngleBloc>(context).add(
      SetMagnetometerValue(events),
    );
    if (count <= window) {
      count++;
    }

    if (count > window) {
      events.removeAt(0);
    }
  }
}

/// compass angle, 0 being north, 90 being west and so on.
/// averaging the data with [simple moving average filter] to
/// prevent data from noises.
double getCompassAngle(List<MagnetometerEvent> events) {
  List<double> anglesInRad = [];
  late double angleInRad;

  for (final MagnetometerEvent event in events) {
    angleInRad = atan2(
      event.x,
      event.y,
    );

    anglesInRad.add(angleInRad);
  }

  /// handle case for 180 and -180 degree
  List<double> negRad = anglesInRad.where((element) => element < 0).toList();

  final posRad = anglesInRad.where((element) => element > 0).toList();

  double sum = 0;

  if (negRad.isEmpty || posRad.isEmpty) {
    sum = anglesInRad.reduce((current, next) => current + next);
  } else if (negRad.every((element) => element >= -1.5) ||
      posRad.every((element) => element <= 1.5)) {
    sum = anglesInRad.reduce((current, next) => current + next);
  } else {
    negRad = negRad.map((e) => e + 2 * pi).toList();
    sum = negRad.reduce((current, next) => current + next) +
        posRad.reduce((current, next) => current + next);
  }

  angleInRad = (sum / anglesInRad.length);

  return (angleInRad * 180 / pi + 360) % 360;
}

Future<bool> getMagnetometerAvailability() async {
  bool isAvailble = await motionSensors.isMagnetometerAvailable();

  return isAvailble;
}

String getDirectionText(int angle) {
  if (angle > 0 && angle < 90) {
    return 'North-East';
  }
  if (angle > 90 && angle < 180) {
    return 'South-East';
  }
  if (angle > 180 && angle < 270) {
    return 'South-West';
  }
  if (angle > 270 && angle < 360) {
    return 'North-West';
  }

  switch (angle) {
    case 0:
      return 'North';
    case 90:
      return 'East';
    case 180:
      return 'South';
    case 270:
      return 'West';
    case 360:
      return 'North';
    default:
      return '';
  }
}
