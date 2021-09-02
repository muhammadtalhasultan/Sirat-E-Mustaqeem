import 'package:flutter/material.dart';

import '../src/core/error/exceptions.dart';
import '../src/features/allah_name/screen/allah_name_screen.dart';
import '../src/features/bottom_tab/screen/tab_screen.dart';
import '../src/features/download/screen/download_screen.dart';
import '../src/features/dua/screen/dua_screen.dart';
import '../src/features/error/screen/database_error_screen.dart';
import '../src/features/permission/screen/location_permission_screen.dart';
import '../src/features/permission/screen/notification_permission_screen.dart';
import '../src/features/prayer_timing/screen/prayer_timing_screen.dart';
import '../src/features/qibla/screen/qibla_screen.dart';
import '../src/features/quran/screen/quran_screen.dart';
import '../src/features/setting/screen/thankyou_screen.dart';
import '../src/features/splash/screen/splash_screen.dart';
import '../src/features/tasbih/screen/tasbih_screen.dart';

class RouteGenerator {
  static const String splash = '/';
  static const String tabScreen = '/tab';
  static const String prayerTimingPage = '/prayer_timing';
  static const String qibla = '/qibla';
  static const String thankyou = '/thank_you';
  static const String download = '/download';
  static const String databaseError = '/database_error';
  static const String allahName = '/allah_name';
  static const String tasbih = '/tasbih';
  static const String dua = '/dua';
  static const String quran = '/quran';
  static const String locationPermission = '/location_permission';
  static const String notificationPermission = '/notification_permission';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
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
      case databaseError:
        return MaterialPageRoute(builder: (_) => const DatabaseErrorScreen());
      case allahName:
        return MaterialPageRoute(builder: (_) => const AllahNameScreen());
      case tasbih:
        return MaterialPageRoute(builder: (_) => const TasbihScreen());
      case dua:
        return MaterialPageRoute(builder: (_) => const DuaScreen());
      case quran:
        return MaterialPageRoute(builder: (_) => const QuranScreen());
      case locationPermission:
        return MaterialPageRoute(
            builder: (_) => const LocationPermissionScreen());
      case notificationPermission:
        return MaterialPageRoute(
            builder: (_) => const NotificationPermissionScreen());
      default:
        throw RouteException('Route not found');
    }
  }
}
