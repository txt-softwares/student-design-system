import 'package:flutter/material.dart';

import '../../config/ds_config.dart';
import '../../spacing/spacing_size.dart';

enum ButtonType { primary, secundary }

class StudentButtonWidget extends StatelessWidget {
  final ButtonType type;
  final String title;
  final bool disabled;
  final bool isLoading;
  final void Function()? onTap;
  final bool outline;
  final double height;
  final double? width;
  final Widget? leading;
  final Widget? prefixIcon;

  final Color? color;
  final Color? textColor;

  ///  Button
  /// button that will be execute show a circular progress indicator
  ///
  /// [text] is the text inside button
  ///
  /// [onTap] is a function will be execute when button is clicked
  ///
  /// [isLoading] is a bool that check if  circular progress
  /// indicator is active.
  /// IMPORTANT -  You need change manually [isLoading]
  /// to activated the circular progress indicator
  ///
  /// [color] is a background color of button

  const StudentButtonWidget({
    Key? key,
    required this.title,
    this.disabled = false,
    this.isLoading = false,
    this.onTap,
    this.height = 60,
    this.leading,
    this.prefixIcon,
    this.color,
    this.width,
    this.textColor,
  })  : outline = false,
        type = ButtonType.primary,
        super(key: key);

  const StudentButtonWidget.secoundary({
    super.key,
    required this.title,
    this.disabled = false,
    this.isLoading = false,
    this.onTap,
    this.height = 60,
    this.leading,
    this.prefixIcon,
    this.color,
    this.width,
    this.textColor,
  })  : type = ButtonType.secundary,
        outline = false;
  Color get buttonColor {
    return type == ButtonType.primary
        ? StudentDesignSystem.config.colors.primary1
        : StudentDesignSystem.config.colors.buttonSecondary1;
  }

  Color get buttonTitleColor {
    return type == ButtonType.primary
        ? Colors.white
        : StudentDesignSystem.config.colors.primary1;
  }

  Color get buttonDisabledColor {
    return type == ButtonType.primary
        ? StudentDesignSystem.config.colors.primary1.withOpacity(0.48)
        : StudentDesignSystem.config.colors.buttonSecondary1.withOpacity(0.48);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: height,
      minWidth: width ?? double.maxFinite,
      shape: outline
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  StudentDesignSystem.config.borderRadius),
              side: BorderSide(color: color!))
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  StudentDesignSystem.config.borderRadius),
            ),
      color: color ?? buttonColor,
      disabledColor: buttonDisabledColor,
      onPressed: !isLoading ? onTap : null,
      child: !isLoading
          ? _buildContent()
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
    );
  }

  Widget _buildContent() {
    if (leading != null) {
      return _buildWithIcon();
    }
    return _buildText();
  }

  Widget _buildText() {
    return Builder(
      builder: (context) {
        return Text(
          title,
          style: TextStyle(
            fontFamily: StudentDesignSystem.config.fontFamily,
            color: textColor ?? buttonTitleColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 0.08,
            letterSpacing: 0.20,
          ),
        );
      },
    );
  }

  Widget _buildWithIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        if (prefixIcon != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: Spacing.x10),
              child: leading,
            ),
          ),
        const SizedBox(
          width: 16,
        ),
        Center(
          child: _buildText(),
        ),
        const SizedBox(
          width: 16,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: Spacing.x10),
            child: leading,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
