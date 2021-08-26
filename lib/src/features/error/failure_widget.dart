import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sirat_e_mustaqeem/src/core/error/error_code.dart';

import '../../core/error/failures.dart';
import '../../core/util/controller/location_controller.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget(this.failure, this.refreshFunction);

  final Failure failure;
  final void Function() refreshFunction;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        refreshFunction();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                failure.message,
                textAlign: TextAlign.center,
              ),
              if (failure is LocalFailure &&
                  (failure as LocalFailure).error ==
                      kLocationDisableForever['errorCode'])
                GestureDetector(
                  onTap: () async => await openLocationSetting(),
                  child: Text(
                    'To App Setting',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
