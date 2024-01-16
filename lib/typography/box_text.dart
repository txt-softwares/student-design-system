import 'package:flutter/material.dart';

import 'text_styles.dart';

class BoxText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? align;

  BoxText.body(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.subcaptionStyle.copyWith(
          color: color,
        ),
        super(key: key);

  BoxText.heading1(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.heading1.copyWith(color: color),
        super(key: key);
  BoxText.heading2(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.heading2.copyWith(color: color),
        super(key: key);
  //
  BoxText.heading3(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.heading3.copyWith(color: color),
        super(key: key);
  //
  BoxText.heading4(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.heading4.copyWith(color: color),
        super(key: key); //
  BoxText.heading5(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.heading5.copyWith(color: color),
        super(key: key); //
  BoxText.heading6(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.heading6.copyWith(color: color),
        super(key: key); //
  BoxText.bodyXLargeBold(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyXLargeBold.copyWith(color: color),
        super(key: key); //
  BoxText.bodyXLargeSemiBold(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyXLargeSemiBold.copyWith(color: color),
        super(key: key); //
  BoxText.bodyXLargeMedium(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyXLargeMedium.copyWith(color: color),
        super(key: key); //
  BoxText.bodyXLargeRegular(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyXLargeRegular.copyWith(color: color),
        super(key: key);
  BoxText.bodyLargeBold(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyLargeBold.copyWith(color: color),
        super(key: key);
  BoxText.bodyLargeSemiBold(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyLargeSemiBold.copyWith(color: color),
        super(key: key);
  BoxText.bodyLargeMedium(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyLargeMedium.copyWith(color: color),
        super(key: key);
  BoxText.bodyLargeRegular(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyLargeRegular.copyWith(color: color),
        super(key: key);
  BoxText.bodyMediumBold(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyMediumBold.copyWith(color: color),
        super(key: key);
  BoxText.bodyMediumSemiBold(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyMediumSemiBold.copyWith(color: color),
        super(key: key);
  BoxText.bodyMediumMedium(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyMediumMedium.copyWith(color: color),
        super(key: key);
  BoxText.bodyMediumRegular(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyMediumRegular.copyWith(color: color),
        super(key: key);
  BoxText.bodySmallBold(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodySmallBold.copyWith(color: color),
        super(key: key);
  BoxText.bodySmallSemiBold(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodySmallSemiBold.copyWith(color: color),
        super(key: key);
  BoxText.bodySmallMidium(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodySmallMidium.copyWith(color: color),
        super(key: key);
  BoxText.bodySmallRegular(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodySmallRegular.copyWith(color: color),
        super(key: key);
  BoxText.bodyXSmallBold(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyXSmallBold.copyWith(color: color),
        super(key: key);
  BoxText.bodyXSmallSemiBold(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyXSmallSemiBold.copyWith(color: color),
        super(key: key);
  BoxText.bodyXSmallMidium(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyXSmallMidium.copyWith(color: color),
        super(key: key);
  BoxText.bodyXSmallRegular(
    this.text, {
    Key? key,
    Color? color,
    this.align,
  })  : style = TextStyles.bodyXSmallRegular.copyWith(color: color),
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
