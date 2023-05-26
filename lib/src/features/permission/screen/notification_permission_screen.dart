import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../routes/routes.dart';
import '../../../core/util/constants.dart';

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 500.h,
                  maxHeight: 0.5.sh,
                ),
                child: LottieBuilder.asset(
                  'assets/images/permission/lottie_json/notification_permission.json',
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Allow your notification',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'We will need your notification to provide you better experience.',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 32.h,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await Permission.notification.request().isGranted) {
                    Navigator.of(context).pushReplacementNamed(
                      RouteGenerator.tabScreen,
                    );
                  } else {
                    Navigator.of(context).pushReplacementNamed(
                      RouteGenerator.tabScreen,
                    );
                  }
                },
                child: Text(
                  'Sure, I like that',
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    RouteGenerator.tabScreen,
                  );
                },
                child: Text(
                  'Not now',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
