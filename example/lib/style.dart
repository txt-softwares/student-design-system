import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class AppStyle {
  static StudentDSConfig dsConfig = StudentDSConfig(
    padding: const EdgeInsets.all(24),
    colors: StudentDSColors(
      primaryRed: MaterialColor(
        const Color(0xFFFF4D6F).value,
        const {
          700: Color(0xFFBF3A53),
          500: Color(0xFFFF4D6F),
          400: Color(0xFFFF6A88),
          300: Color(0xFFFF89A2),
          200: Color(0xFFFFAABD),
          100: Color(0xFFFFCCD8),
          50: Color(0xFFFFEFF3),
        },
      ),
      primaryPurple: MaterialColor(
        const Color(0xFFB140FF).value,
        const {
          700: Color(0xFF8830BF),
          500: Color(0xFFB140FF),
          400: Color(0xFFBF5FFF),
          300: Color(0xFFCD81FF),
          200: Color(0xFFDBA3FF),
          100: Color(0xFFEAC8FF),
          50: Color(0xFFF9EEFF),
        },
      ),
      primaryBlue: MaterialColor(
        const Color(0xFF0AD9FF).value,
        const {
          700: Color(0xFF0295C2),
          500: Color(0xFF0AD9FF),
          400: Color(0xFF32E5FF),
          300: Color(0xFF5EEEFF),
          200: Color(0xFF8DF6FF),
          100: Color(0xFFBCFBFF),
          50: Color(0xFFEBFEFF),
        },
      ),
      secondaryGreen: MaterialColor(
        const Color(0xFFB7DF5D).value,
        const {
          700: Color(0xFF8CAA46),
          500: Color(0xFFB7DF5D),
          400: Color(0xFFC6E778),
          300: Color(0xFFD4EF95),
          200: Color(0xFFE2F5B2),
          100: Color(0xFFEEFAD1),
          50: Color(0xFFFAFEF1),
        },
      ),
      secondaryYellow: MaterialColor(
        const Color(0xFFFFD714).value,
        const {
          700: Color(0xFFBFA40F),
          500: Color(0xFFFFD714),
          400: Color(0xFFFFE03B),
          300: Color(0xFFFFE863),
          200: Color(0xFFFFF08E),
          100: Color(0xFFFFF6BC),
          50: Color(0xFFFFFDEB),
        },
      ),
      dark: MaterialColor(
        const Color(0xFF00124F).value,
        const {
          900: Color(0xFF00124F),
          800: Color(0xFF495376),
          700: Color(0xFF5B6589),
          600: Color(0xFF6F799C),
          500: Color(0xFF7F89A8),
          400: Color(0xFFBBBFD1),
          300: Color(0xFFD6D8E3),
          200: Color(0xFFE3E5EC),
          100: Color(0xFFF0F1F5),
          50: Color(0xFFFAFAFC),
        },
      ),
      error: MaterialColor(
        const Color(0xFFFF7043).value,
        const {
          500: Color(0xFFFF7043),
          400: Color(0xFFFF8763),
          300: Color(0xFFFF9F84),
          200: Color(0xFFFFBAA7),
          100: Color(0xFFFFD6CC),
          50: Color(0xFFFFF5F2),
        },
      ),
      white: Colors.white,
      black: Colors.black,
      transparentRed: const Color(0x14FF4D6F),
      transparentPurple: const Color(0x14B140FF),
      transparentBlue: const Color(0x140AD9FF),
      transparentGreen: const Color(0x14B7DF5D),
      transparentYellow: const Color(0x14FFD714),
      transparentDarkBlue: const Color(0x1400124F),
      scafoldBackground: Colors.white,
    ),
    fontFamily: 'Roboto',
    borderRadius: 8.0,
    spacing: 16.0,
  );
}
