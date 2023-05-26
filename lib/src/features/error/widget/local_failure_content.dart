import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/error/error_code.dart';
import '../../../core/error/failures.dart';
import '../../../core/util/controller/location_controller.dart';

class LocalFailureContent extends StatelessWidget {
  const LocalFailureContent(this.failure);

  final LocalFailure failure;

  @override
  Widget build(BuildContext context) {
    if (failure.error == kLocationDisableForever['errorCode'])
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500.w,
            ),
            child: LottieBuilder.asset(
              'assets/images/error/lottie_json/no_gps.json',
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            failure.message,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.h,
          ),
          GestureDetector(
            onTap: () async => await openLocationSetting(),
            child: Text(
              'To App Setting',
            ),
          ),
          if (failure.extraInfo != null)
            Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  failure.extraInfo!,
                  textAlign: TextAlign.center,
                ),
              ],
            )
        ],
      );
    if (failure.error == kReadDatabaseFailed['errorCode']) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500.w,
            ),
            child: LottieBuilder.asset(
              'assets/images/error/lottie_json/database_error.json',
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            failure.message,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          if (failure.extraInfo != null)
            Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  failure.extraInfo!,
                  textAlign: TextAlign.center,
                ),
              ],
            )
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 500.w,
          ),
          child: LottieBuilder.asset(
            'assets/images/error/lottie_json/general_error.json',
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          failure.message,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
