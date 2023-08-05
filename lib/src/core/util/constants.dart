import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String PRAYER_TIMING_URL = 'http://api.aladhan.com/v1/timings/';

const String DATABASE_FILE = 'siratemustaqeem-db.db';
const String DATABASE_URL = 'https://talhasultan.dev/assets/';

const String PLAY_STORE_URL = 'https://play.google.com/store/apps/details?id=com.devtechnologies.siratemustaqeem';
const WEBSITE_URL = 'https://talhasultan.dev/';
const EMAIL_URL = 'mailto:talhasultan.dev@gmail.com?subject=Sirate%20Mustaqeem%20Query';
const MEDIUM_URL = 'https://medium.com/@muhammadtalhasultan';
const YOUTUBE_URL = 'https://www.youtube.com/channel/UC-cBM3nBHd5t6BKKznR3GNg';
const FACEBOOK_URL = 'https://www.facebook.com/groups/218761196363628';
const INSTA_URL = 'https://www.instagram.com/talhasultandev/';

const Color kLightPrimary = Color(0xFF5AD383);
const Color kLightAccent = Color(0xFF48AB8C);
const Color kLightTextColor = Colors.black;
const Color kLightPlaceholder = Color(0xFFE8EAF0);
const Color kLightPlaceholderText = Color(0xFFC6CAD3);
const Color kLightBg = Color(0xFFFFFFFF);
const Color kLightError = Color(0xFFFF7971);

const Color kDarkPrimary = Color(0xFF4CC49B);
const Color kDarkAccent = Color(0xFF4CC49B);
const Color kDarkTextColor = Colors.white;
const Color kDarkPlaceholder = Color(0xFF2D3655);
const Color kDarkPlaceholderText = Color(0xFF525C7C);
const Color kDarkBg = Color(0xFF2D3251);
const Color kDarkError = Color(0xFFD0524A);

const Duration kAnimationDuration = Duration(milliseconds: 300);
const Curve kAnimationCurve = Curves.easeInOut;

EdgeInsets kPagePadding = EdgeInsets.symmetric(
  horizontal: 16.w,
);

EdgeInsets kCardPadding = EdgeInsets.symmetric(
  horizontal: 16.w,
  vertical: 16.h,
);

EdgeInsets kInputFieldPadding = EdgeInsets.symmetric(
  horizontal: 16.w,
  vertical: 16.h,
);

BorderRadiusGeometry kCardBorderRadius = BorderRadius.circular(
  16.r,
);

BorderRadius kAppIconBorderRadius = BorderRadius.circular(
  8.r,
);

BorderRadiusGeometry kBottomSheetBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(16.r),
  topRight: Radius.circular(16.r),
);
