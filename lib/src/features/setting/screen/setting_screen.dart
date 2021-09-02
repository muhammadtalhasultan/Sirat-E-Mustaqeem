import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/general_card.dart';
import '../widget/social_media_card.dart';
import '../widget/user_preference_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              GeneralCard(),
              SizedBox(
                height: 16.h,
              ),
              UserPreferenceCard(),
              SizedBox(
                height: 16.h,
              ),
              SocialMediaCard(),
            ],
          ),
        ),
      ),
    );
  }
}
