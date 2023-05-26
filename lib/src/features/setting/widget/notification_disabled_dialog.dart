import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/util/constants.dart';

class NotificationDisabledDialog extends StatelessWidget {
  const NotificationDisabledDialog();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: kPagePadding,
        padding: EdgeInsets.symmetric(
          vertical: 48.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          borderRadius: kCardBorderRadius,
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500.w),
              child: LottieBuilder.asset(
                'assets/images/permission/lottie_json/notification_permission.json',
                height: 0.3.sh,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'You have denied the notification permission previously. '
              'Please go to app setting to enabled it.',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () async {
                await openAppSettings();
              },
              child: Text(
                'To app setting',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
