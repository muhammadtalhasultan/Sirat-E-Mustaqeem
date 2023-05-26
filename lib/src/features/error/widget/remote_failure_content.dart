import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../core/error/error_code.dart';
import '../../../core/error/failures.dart';

class RemoteFailureContent extends StatelessWidget {
  const RemoteFailureContent(this.failure);

  final RemoteFailure failure;

  @override
  Widget build(BuildContext context) {
    if (failure.errorCode == RemoteErrorCode.INTERNET_ERROR_CODE) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 500.w,
            ),
            child: ClipOval(
              child: LottieBuilder.asset(
                'assets/images/error/lottie_json/no_internet.json',
              ),
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
