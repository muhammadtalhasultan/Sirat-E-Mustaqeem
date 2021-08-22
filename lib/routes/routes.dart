import 'package:flutter/material.dart';
import 'package:sirat_e_mustaqeem/src/features/qibla/screen/qibla_screen.dart';

import '../src/core/error/exceptions.dart';
import '../src/features/bottom_tab/screen/tab_screen.dart';
import '../src/features/prayer_timing/screen/prayer_timing_screen.dart';

class RouteGenerator {
  static const String tabScreen = '/';
  static const String prayerTimingPage = '/prayer_timing';
  static const String qibla = '/qibla';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case tabScreen:
        return MaterialPageRoute(builder: (_) => const TabScreen());
      case prayerTimingPage:
        return MaterialPageRoute(builder: (_) => const PrayerTimingScreen());
      case qibla:
        return MaterialPageRoute(builder: (_) => const QiblaScreen());
      default:
        throw RouteException('Route not found');
    }
  }
}
