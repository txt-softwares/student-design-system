import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class AppStyle {
  StudentDSConfig config = StudentDSConfig(
    padding: const EdgeInsets.all(24),
    colors: StudentDSColors(
      buttonSecounday1: const Color(0xffFFEFF3),
      primary1: const Color(0xffFF4D6F),
      primary2: Colors.black,
      primary3: Colors.black,
      secondary1: Colors.black,
      secondary2: Colors.black,
      dark: MaterialColor(Colors.black.value, const {
        50: Colors.black,
      }),
      error: MaterialColor(Colors.black.value, const {
        50: Colors.black,
      }),
      success: Colors.black,
      warning: Colors.black,
      white: Colors.black,
      black: Colors.black,
      transparentRed: Colors.black,
      transparentPurple: Colors.black,
      transparentBlue: Colors.black,
      transparentGreen: Colors.black,
      transparentYellow: Colors.black,
      transparentDarkBlue: Colors.black,
      scafoldBackground: Colors.white,
    ),
    fontFamily: 'Roboto',
    borderRadius: 8.0,
    spacing: 16.0,
  );
}
