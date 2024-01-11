import 'package:flutter/material.dart';

import 'app_colors.dart';

class DesignSystemConfig {
  final StudentDSColors colors;
  final String fontFamily;
  final double borderRadius;
  final double spacing;
  final EdgeInsets padding;

  DesignSystemConfig({
    required this.colors,
    required this.fontFamily,
    required this.borderRadius,
    required this.spacing,
    required this.padding,
  });
}
