import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> init() async {
    await _configureLocalTimeZone();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: _onSelectNotification,
    );
  }

  Future _onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {}

  Future _onSelectNotification(String? payload) async {
    //Handle notification tapped logic here
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();

    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();

    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

//   Future<void> showNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
// String channelId,
//   String channelName,
//   String channelDescription, {
//   String? icon, /// icon to display
//   Importance importance = Importance.defaultImportance,
//   Priority priority = Priority.defaultPriority,

//   AndroidNotificationSound? sound,

//   int? when,

//   String? ticker,
//   NotificationVisibility? visibility,
//   int? timeoutAfter,
//   String? category,

//   );

//     const IOSNotificationDetails iosPlatformChannelSpecifics =
//         IOSNotificationDetails(
//             bool? presentAlert,
//   bool? presentBadge,
//   bool? presentSound,
//   String? sound,
//   int? badgeNumber,
//   List<IOSNotificationAttachment>? attachments,
//   String? subtitle,
//   String? threadIdentifier,
//            );
//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.show(
//         0, 'plain title', 'plain body', platformChannelSpecifics,
//         payload: 'item x');
//   }
}
