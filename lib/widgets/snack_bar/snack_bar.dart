import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class StudentSnackBar {
  static void show({
    required String text,
    required BuildContext context,
    required Color? bgColor,
    required Color? mainColor,
    Widget? icon,
  }) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: bgColor ?? StudentDesignSystem.config.colors.error[50]!,
      message: text,
      margin: StudentDesignSystem.config.padding,
      borderRadius: BorderRadius.circular(12),
      borderColor: mainColor ?? StudentDesignSystem.config.colors.error[500]!,
      icon: icon,
      padding: const EdgeInsets.all(12),
      duration: const Duration(seconds: 3),
      messageText: Text(
        text,
        style: TextStyles.bodyMediumMedium.copyWith(
          color: mainColor ?? StudentDesignSystem.config.colors.error[500]!,
        ),
      ),
    ).show(context);
  }
}
