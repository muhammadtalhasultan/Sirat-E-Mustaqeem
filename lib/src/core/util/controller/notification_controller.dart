import 'package:flutter/material.dart';

import '../../../../routes/routes.dart';
import '../../notification/notification_service.dart';
import '../../notification/receive_notification.dart';

void configureDidReceiveLocalNotificationSubject(BuildContext context) {
  NotificationService()
      .didReceiveLocalNotificationSubject
      .stream
      .listen((ReceivedNotification receivedNotification) async {
    await Navigator.of(context).pushNamed(RouteGenerator.prayerTimingPage);
  });
}

void configureSelectNotificationSubject(BuildContext context) {
  NotificationService()
      .selectNotificationSubject
      .stream
      .listen((String? payload) async {
    await Navigator.of(context).pushNamed(RouteGenerator.prayerTimingPage);
  });
}
