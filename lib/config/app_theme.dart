import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData create(StudentDSColors colors) => ThemeData(
        primaryColor: colors.primary1,
        brightness: Brightness.light,
        scaffoldBackgroundColor: colors.scafoldBackground,
      );
}
