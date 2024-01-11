import 'package:flutter/material.dart';

import 'ds_config.dart';

class StudentAppTheme {
  static ThemeData getThemeData() {
    final config = StudentDesignSystem.config;

    return ThemeData(
      primaryColor: config.colors.primary1,
      scaffoldBackgroundColor: config.colors.scafoldBackground,
      fontFamily: config.fontFamily,
      textTheme: const TextTheme(),
      appBarTheme: AppBarTheme(
        color: config.colors.primary2,
        elevation: 0,
        iconTheme: IconThemeData(color: config.colors.white),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: config.colors.primary1,
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
          primary: config.colors.primary1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(config.borderRadius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          primary: config.colors.primary1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(config.borderRadius),
          ),
        ),
      ),
    );
  }
}
