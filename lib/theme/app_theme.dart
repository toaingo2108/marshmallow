import 'package:flutter/material.dart';
import 'package:marshmallow/theme/app_colors.dart';

class AppTheme {
  ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Lexend',
    primaryColor: AppColors.primaryColor,
    canvasColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.grey[800],
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.textColor),
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.grey[500],
      fill: 0,
      opticalSize: 24,
      weight: 300,
    ),
  );

  SliderThemeData customSlider = SliderThemeData(
    activeTrackColor: AppColors.darkPrimaryColor,
    showValueIndicator: ShowValueIndicator.always,
    valueIndicatorColor: AppColors.primaryColor,
    valueIndicatorTextStyle: const TextStyle(
      color: AppColors.white,
      fontFamily: 'Lexend',
      fontSize: 12,
    ),
    inactiveTrackColor: AppColors.inactiveSwitchGray,
    trackHeight: 22.0,
    thumbColor: Colors.white,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
    overlayColor: AppColors.lightPrimaryColor.withOpacity(0.1),
  );
}
