import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/constants.dart';

class ChangeNotificationSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  ChangeNotificationSwitch({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value == false ? onChanged(true) : onChanged(false);
      },
      child: AnimatedContainer(
        duration: kAnimationDuration,
        curve: kAnimationCurve,
        width: 80.0.w,
        height: 40.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0.r),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/images/setting_icon/svg/notification_outlined_disabled.svg',
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      width: 20.w,
                    ),
                    SvgPicture.asset(
                      'assets/images/setting_icon/svg/notification_outlined_enabled.svg',
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      width: 20.w,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0.w,
              ),
              child: AnimatedAlign(
                duration: kAnimationDuration,
                curve: kAnimationCurve,
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 28.0.w,
                  height: 28.0.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: AnimatedSwitcher(
                    duration: kAnimationDuration,
                    switchInCurve: kAnimationCurve,
                    reverseDuration: Duration.zero,
                    child: value
                        ? SvgPicture.asset(
                            'assets/images/setting_icon/svg/notification_enabled.svg',
                            width: 20.w,
                          )
                        : SvgPicture.asset(
                            'assets/images/setting_icon/svg/notification_disabled.svg',
                            width: 20.w,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
