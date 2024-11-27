import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    primaryColor: AppColors.bluePrimary,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.w700,
        fontSize: 20.0,
        color: AppColors.black,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.w700,
        fontSize: 16.0,
        color: AppColors.black,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Helvetica',
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        color: AppColors.black,
      ),
    ),
  );
}
