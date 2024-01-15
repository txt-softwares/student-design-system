import 'package:flutter/material.dart';

import 'ds_config.dart';

class StudentAppTheme {
  static ThemeData getThemeData() {
    final config = StudentDesignSystem.config;

    return ThemeData(
      primaryColor: config.colors.primaryRed,
      scaffoldBackgroundColor: config.colors.scafoldBackground,
      fontFamily: config.fontFamily,
      textTheme: const TextTheme(),
      appBarTheme: AppBarTheme(
        color: config.colors.primaryPurple,
        elevation: 0,
        iconTheme: IconThemeData(color: config.colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: config.colors.primaryRed,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(config.borderRadius),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(config.borderRadius),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: config.colors.primaryRed,
          textStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(config.borderRadius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: config.colors.primaryRed,
          textStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(config.borderRadius),
          ),
        ),
      ),
    );
  }
}
