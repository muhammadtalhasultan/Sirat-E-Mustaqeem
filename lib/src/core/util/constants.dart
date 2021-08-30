import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String PRAYER_TIMING_URL = 'http://api.aladhan.com/v1/timings/';

const String DATABASE_FILE = 'siratemustaqeem-db.db';
const String DATABASE_URL =
    'https://raw.githubusercontent.com/muhammadtalhasultan/Sirat-e-Mustaqeem-Master/';

const String PLAY_STORE_URL = 'https://flutter.dev/';
const WEBSITE_URL = 'https://flutter.dev/';
const EMAIL_URL = 'https://flutter.dev/';
const MEDIUM_URL = 'https://flutter.dev/';
const YOUTUBE_URL = 'https://www.youtube.com/channel/UC-cBM3nBHd5t6BKKznR3GNg';
const FACEBOOK_URL = 'https://www.facebook.com/groups/218761196363628';
const INSTA_URL = 'https://flutter.dev/';

const Color kLightPrimary = Color(0xFF5AD383);
const Color kLightAccent = Color(0xFF48AB8C);
const Color kLightTextColor = Colors.black;
const Color kLightPlaceholder = Color(0xFFE8EAF0);
const Color kLightPlaceholderText = Color(0xFFC6CAD3);
const Color kLightBg = Color(0xFFFFFFFF);

const Color kDarkPrimary = Color(0xFF4CC49B);
const Color kDarkAccent = Color(0xFF4CC49B);
const Color kDarkTextColor = Colors.white;
const Color kDarkPlaceholder = Color(0xFF2D3655);
const Color kDarkPlaceholderText = Color(0xFF525C7C);
const Color kDarkBg = Color(0xFF2D3251);

const Duration kAnimationDuration = Duration(milliseconds: 300);
const Curve kAnimationCurve = Curves.easeInOut;

EdgeInsets kPagePadding = EdgeInsets.symmetric(
  horizontal: 16.w,
);
EdgeInsets kCardPadding = EdgeInsets.symmetric(
  horizontal: 16.w,
  vertical: 16.h,
);
BorderRadiusGeometry kCardBorderRadius = BorderRadius.circular(
  16.r,
);
