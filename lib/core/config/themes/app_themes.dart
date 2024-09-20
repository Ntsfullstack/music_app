import 'package:flutter/material.dart';
import 'package:spotify/core/config/themes/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary ,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    scaffoldBackgroundColor: AppColors.lightColor ,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        )
      )
    )
  );
  static final darkTheme = ThemeData(
      primaryColor: AppColors.primary,
      brightness: Brightness.dark,
      fontFamily: 'Satoshi',
      scaffoldBackgroundColor: AppColors.darkColor ,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              )
          )
      )
  );
}