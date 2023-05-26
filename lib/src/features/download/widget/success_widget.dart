import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../routes/routes.dart';
import '../../../core/util/constants.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1.sw,
        padding: kPagePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500.w),
              child: LottieBuilder.asset(
                'assets/images/core/json/all_set.json',
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Database downloaded!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Before using \'Sirate Mustaqueem\', '
              'we need to ask for your permission to use your phone services.',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16.h,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(RouteGenerator.locationPermission);
              },
              child: Text(
                'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
