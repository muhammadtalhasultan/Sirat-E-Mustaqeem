import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/api_service.dart';
import '../../../core/network/network_client.dart';
import '../../../core/util/constants.dart';
import '../../../core/util/controller/location_controller.dart';
import '../../error/error_code.dart';
import '../../notification/notification_service.dart';
import '../model/timing.dart';

/// class to differentiate next prayer time
class TimingController {
  final Timings timings;

  /// index of the prayer timing
  int _timingCount = 0;

  /// weather to look for result for tomorrow
  bool _forTomorrow = false;

  /// list to store data for each prayer timing
  late final List<Map<String, String>> _timingsList;

  TimingController(this.timings) {
    _timingsList = [
      {'Fajr': timings.fajr},
      {'Dhuhr': timings.dhuhr},
      {'Asr': timings.asr},
      {'Maghrib': timings.maghrib},
      {'Isha': timings.isha},
    ];
    getTimingCount();
  }

  /// find which prayer time is next according to current time
  void getTimingCount() {
    final DateTime currentTime = DateTime.now();
    final hours = currentTime.hour;
    final mins = currentTime.minute;

    for (final Map<String, String> timing in _timingsList) {
      final timingHour = timing.entries.first.value.split(':')[0];
      final timingMin = timing.entries.first.value.split(':')[1];

      if (int.parse(timingHour) < hours) {
        _timingCount++;
      } else if (int.parse(timingHour) == hours &&
          int.parse(timingMin) <= mins) {
        _timingCount++;
      }
    }

    if (_timingCount == 5) {
      _timingCount = 0;
      _forTomorrow = true;
    }
  }

  /// if index is 5, this means today's prayer timing is finished,
  /// hence, the index is back to 0 (for the next day)
  int get timingCount => _timingCount;
  bool get forTomorrow => _forTomorrow;
  List<Map<String, String>> get timingsList => _timingsList;
  Map<String, String> get currentTiming => _timingsList[_timingCount];
  String get prayer => _timingsList[_timingCount].entries.first.key;
  String get timing => _timingsList[_timingCount].entries.first.value;
}

/// function to call api and get prayer timings
Future<Either<Failure, Timing>> getPrayerTiming({forTomorrow = false}) async {
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
  int timestamp = ((DateTime.now().millisecondsSinceEpoch) / 1000).floor();

  if (forTomorrow) {
    final newDate = DateTime.now().add(
      Duration(
        days: 1,
      ),
    );

    timestamp = ((DateTime(
              newDate.year,
              newDate.month,
              newDate.day,
            ).millisecondsSinceEpoch) /
            1000)
        .floor();
  }

  try {
    /// returned response from the api
    Response timingResponse =
        await apiService.getPrayerTiming(timestamp, params);

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
            message: timingResponse.statusCode,
            errorType: DioErrorType.response),
      );
    }
  } on RemoteException catch (e) {
    String errorMessage = e.dioError.message;
    for (final error in RemoteErrorCode.remoteErrors) {
      if (e.dioError.message.contains(error['rawMessage'].toString())) {
        errorMessage = error['message'].toString();
      }
    }
    return Left(
      RemoteFailure(
        message: errorMessage,
        errorType: DioErrorType.response,
      ),
    );
  }
}

String convertTimeTo12HourFormat(String timing) {
  int hour = int.parse(timing.split(':')[0]);
  final int min = int.parse(timing.split(':')[1]);
  String minInString = min.toString();
  String amPm = 'AM';

  if (hour >= 12) {
    amPm = 'PM';
  }

  if (hour > 12) {
    hour -= 12;
  }

  if (min < 10) {
    minInString = '0$min';
  }

  return '$hour:$minInString $amPm';
}

Future<void> addToLocalNotification(
    List<Map<String, String>> timingsList) async {
  await NotificationService().cancelAllNotifications();
  int i = 0;

  await Future.forEach(timingsList, (Map<String, String> timing) async {
    final timingHour = int.parse(timing.entries.first.value.split(':')[0]);
    final timingMin = int.parse(timing.entries.first.value.split(':')[1]);
    Duration duration = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      timingHour,
      timingMin,
    ).difference(DateTime.now());

    if (DateTime.now().hour > timingHour) {
      duration = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
        timingHour,
        timingMin,
      ).difference(DateTime.now());
    } else if (DateTime.now().hour == timingHour &&
        DateTime.now().minute >= timingMin) {
      duration = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
        timingHour,
        timingMin,
      ).difference(DateTime.now());
    }

    await NotificationService().showPrayerNotification(
      id: i,
      title: timing.entries.first.key,
      body: 'The next prayer time is now.',
      duration: duration,
    );

    i++;
  });
}
