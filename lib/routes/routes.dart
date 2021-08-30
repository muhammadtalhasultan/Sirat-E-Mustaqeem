import 'package:flutter/material.dart';

import '../src/core/error/exceptions.dart';
import '../src/features/bottom_tab/screen/tab_screen.dart';
import '../src/features/download/screen/download_screen.dart';
import '../src/features/prayer_timing/screen/prayer_timing_screen.dart';
import '../src/features/qibla/screen/qibla_screen.dart';
import '../src/features/setting/screen/thankyou_screen.dart';

class RouteGenerator {
  static const String tabScreen = '/';
  static const String prayerTimingPage = '/prayer_timing';
  static const String qibla = '/qibla';
  static const String thankyou = '/thank_you';
  static const String download = '/download';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case tabScreen:
        return MaterialPageRoute(builder: (_) => const TabScreen());
      case prayerTimingPage:
        return MaterialPageRoute(builder: (_) => const PrayerTimingScreen());
      case qibla:
        return MaterialPageRoute(builder: (_) => const QiblaScreen());
      case thankyou:
        return MaterialPageRoute(builder: (_) => const ThankyouScreen());
      case download:
        return MaterialPageRoute(builder: (_) => const DownloadScreen());
      default:
        throw RouteException('Route not found');
    }
  }
}
