import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

enum AppTheme { Dark, Light }

final Map<AppTheme, ThemeData> kAppThemeData = {
  AppTheme.Dark: ThemeData.dark().copyWith(
    primaryColor: kDarkPrimary,
    scaffoldBackgroundColor: kDarkBg,
    backgroundColor: kDarkPlaceholder,
    textTheme: GoogleFonts.openSansTextTheme(
      TextTheme().copyWith(
        headline1: TextStyle(
          fontSize: 32.sp,
          color: kDarkTextColor,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 32.sp,
          color: kDarkTextColor,
        ),
        headline3: TextStyle(
          fontSize: 24.sp,
          color: kDarkTextColor,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontSize: 24.sp,
          color: kDarkTextColor,
        ),
        headline5: TextStyle(
          fontSize: 20.sp,
          color: kDarkTextColor,
        ),
        headline6: TextStyle(
          fontSize: 16.sp,
          color: kDarkTextColor,
        ),
        bodyText1: TextStyle(
          fontSize: 12.sp,
          color: kDarkTextColor,
        ),
        bodyText2: TextStyle(
          fontSize: 14.sp,
          color: kDarkTextColor,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        foregroundColor: MaterialStateProperty.all(
          kDarkPlaceholder,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kDarkBg,
      selectedItemColor: kDarkPrimary,
      selectedIconTheme: IconThemeData(
        color: kDarkPrimary,
        size: 24.sp,
      ),
      unselectedItemColor: kDarkPlaceholderText,
      unselectedIconTheme: IconThemeData(
        color: kDarkPlaceholderText,
        size: 24.sp,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: kDarkBg,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(
        color: kDarkPlaceholderText,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      refreshBackgroundColor: kDarkPlaceholder,
    ),
    colorScheme: ColorScheme.dark().copyWith(
      background: kDarkPlaceholder,
      surface: kDarkPlaceholderText,
      primary: kDarkPrimary,
      secondary: kDarkAccent,
    ),
  ),
  AppTheme.Light: ThemeData.light().copyWith(
    primaryColor: kLightPrimary,
    scaffoldBackgroundColor: kLightBg,
    backgroundColor: kLightPlaceholder,
    textTheme: GoogleFonts.openSansTextTheme(
      TextTheme().copyWith(
        headline1: TextStyle(
          fontSize: 32.sp,
          color: kLightTextColor,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 32.sp,
          color: kLightTextColor,
        ),
        headline3: TextStyle(
          fontSize: 24.sp,
          color: kLightTextColor,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontSize: 24.sp,
          color: kLightTextColor,
        ),
        headline5: TextStyle(
          fontSize: 20.sp,
          color: kLightTextColor,
        ),
        headline6: TextStyle(
          fontSize: 16.sp,
          color: kLightTextColor,
        ),
        bodyText1: TextStyle(
          fontSize: 12.sp,
          color: kLightTextColor,
        ),
        bodyText2: TextStyle(
          fontSize: 14.sp,
          color: kLightTextColor,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: kLightPrimary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kLightBg,
      selectedItemColor: kLightPrimary,
      selectedIconTheme: IconThemeData(
        color: kLightPrimary,
        size: 24.sp,
      ),
      unselectedItemColor: kLightPlaceholderText,
      unselectedIconTheme: IconThemeData(
        color: kLightPlaceholderText,
        size: 24.sp,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      refreshBackgroundColor: kLightPlaceholder,
    ),
    colorScheme: ColorScheme.light().copyWith(
      background: kLightPlaceholder,
      surface: kLightPlaceholderText,
      primary: kLightPrimary,
      secondary: kLightAccent,
    ),
  )
};
