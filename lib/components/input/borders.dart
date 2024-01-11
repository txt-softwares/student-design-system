import 'package:flutter/material.dart';

class InputBorderType {
  static InputBorder getBorder(bool allBorder) {
    return allBorder
        ? InputBorderType.borderAll
        : InputBorderType.borderUnderLine;
  }

  static InputBorder get borderUnderLine {
    return UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF797979)),
    );
  }

  static InputBorder get borderAll {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xFF797979)),
    );
  }
}
