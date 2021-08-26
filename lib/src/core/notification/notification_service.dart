import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import 'receive_notification.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  /// initialize flutter local notification plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// create stream to add notification class (defined)
  final BehaviorSubject<ReceivedNotification>
      didReceiveLocalNotificationSubject =
      BehaviorSubject<ReceivedNotification>();

  /// create stream to add notification  (defined) ios<10+
  final BehaviorSubject<String?> selectNotificationSubject =
      BehaviorSubject<String?>();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  /// initialize this notification service
  Future<void> init() async {
    /// use for schedule notification
    await _configureLocalTimeZone();

    /// andriod local notification setting
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('circle_kesan');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    /// ios local notification setting
    /// [onDidRecieveLocalNotification] handler for clicking notification while in
    /// app
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

    /// [onSelectNotification] handler for clicking notification while in
    /// app ios<10+
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: _onSelectNotification,
    );
  }

  /// add notification to the stream so other page can subscribe it
  /// and get the notification
  Future _onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    didReceiveLocalNotificationSubject.add(
      ReceivedNotification(
        id: id,
        title: title,
        body: body,
        payload: payload,
      ),
    );
  }

  /// add notification to the stream so other page can subscribe it
  /// and get the notification
  Future _onSelectNotification(String? payload) async {
    selectNotificationSubject.add(payload);
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();

    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();

    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  Future<void> showPrayerNotification() async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '1',
      'Prayer Timing',
      'Notification to tell user that it is time for Muslim prayer.',
      importance: Importance.max,
      //icon:
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      // when:
      ticker: 'Prayer Timing',
      visibility: NotificationVisibility.public,
      timeoutAfter: 10000,
      category: 'reminder',
    );

    IOSNotificationDetails iosPlatformChannelSpecifics = IOSNotificationDetails(
      sound: 'slow_spring_board.aiff',
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
        0, 'plain title', 'plain body', platformChannelSpecifics,
        payload: 'item x');
  }
}
