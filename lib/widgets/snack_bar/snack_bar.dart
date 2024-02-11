import 'package:flutter/material.dart';

class StudentSnackBar {
  static void show({
    required String text,
    required BuildContext context,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color ?? Colors.red,
        content: Text(text),
      ),
    );
  }
}
