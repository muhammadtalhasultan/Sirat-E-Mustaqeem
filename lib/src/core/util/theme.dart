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
    textTheme: GoogleFonts.openSansTextTheme(
      TextTheme().copyWith(
        displayLarge: TextStyle(
          fontSize: 64.sp,
          color: kDarkTextColor,
        ),
        displayMedium: TextStyle(
          fontSize: 32.sp,
          color: kDarkTextColor,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          color: kDarkTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 24.sp,
          color: kDarkTextColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 20.sp,
          color: kDarkTextColor,
        ),
        titleLarge: TextStyle(
          fontSize: 16.sp,
          color: kDarkTextColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 12.sp,
          color: kDarkTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          color: kDarkTextColor,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 56.h),
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        foregroundColor: MaterialStateProperty.all(
          kDarkTextColor,
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: kDarkTextColor,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(kDarkPrimary),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: kDarkPrimary,
          ),
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
        color: kDarkTextColor,
      ),
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: kDarkTextColor,
      ),
    ),
    colorScheme: ColorScheme.dark()
        .copyWith(
          background: kDarkPlaceholder,
          surface: kDarkPlaceholderText,
          primary: kDarkPrimary,
          secondary: kDarkAccent,
        )
        .copyWith(background: kDarkPlaceholder)
        .copyWith(error: kDarkError),
  ),
  AppTheme.Light: ThemeData.light().copyWith(
    primaryColor: kLightPrimary,
    scaffoldBackgroundColor: kLightBg,
    textTheme: GoogleFonts.openSansTextTheme(
      TextTheme().copyWith(
        displayLarge: TextStyle(
          fontSize: 64.sp,
          color: kLightTextColor,
        ),
        displayMedium: TextStyle(
          fontSize: 32.sp,
          color: kLightTextColor,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          color: kLightTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 24.sp,
          color: kLightTextColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 20.sp,
          color: kLightTextColor,
        ),
        titleLarge: TextStyle(
          fontSize: 16.sp,
          color: kLightTextColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 12.sp,
          color: kLightTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          color: kLightTextColor,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 56.h),
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
        foregroundColor: MaterialStateProperty.all(
          kDarkTextColor,
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: kDarkTextColor,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(kLightPrimary),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: kLightPrimary,
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: kLightPrimary,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: kDarkTextColor,
      ),
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
    colorScheme: ColorScheme.light()
        .copyWith(
          background: kLightPlaceholder,
          surface: kLightPlaceholderText,
          primary: kLightPrimary,
          secondary: kLightAccent,
        )
        .copyWith(background: kLightPlaceholder)
        .copyWith(error: kLightError),
  )
};
