import 'package:flutter/material.dart';
import 'package:sirat_e_mustaqeem/routes/routes.dart';
import 'package:sirat_e_mustaqeem/src/core/notification/notification_service.dart';
import 'package:sirat_e_mustaqeem/src/core/notification/receive_notification.dart';

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
