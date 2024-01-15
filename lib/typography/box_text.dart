import 'package:flutter/material.dart';

import 'text_styles.dart';

class BoxText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? align;

  BoxText.body(
    this.text, {
    Key? key,
    Color color = Colors.black,
    double? size,
    FontWeight? weight,
    this.align,
  })  : style = TextStyles.subcaptionStyle.copyWith(
          color: color,
          fontSize: size,
          fontWeight: weight,
        ),
        super(key: key);

  BoxText.heading1(
    this.text, {
    Key? key,
    Color color = Colors.black,
    this.align,
  })  : style = TextStyles.heading1.copyWith(color: color),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: style,
    );
  }
}
