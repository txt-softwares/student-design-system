import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:student_design_system/student_design_system.dart';

enum ButtonType { primary, secundary }

class StudentButtonWidget extends StatelessWidget {
  final ButtonType type;
  final String title;
  final bool isLoading;
  final void Function()? onTap;
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
    this.isLoading = false,
    this.onTap,
    this.height = 56,
    this.leading,
    this.prefixIcon,
    this.color,
    this.width,
    this.textColor,
  })  : type = ButtonType.primary,
        super(key: key);

  const StudentButtonWidget.secoundary({
    super.key,
    required this.title,
    this.isLoading = false,
    this.onTap,
    this.height = 56,
    this.leading,
    this.prefixIcon,
    this.color,
    this.width,
    this.textColor,
  }) : type = ButtonType.secundary;
  Color get buttonColor {
    return type == ButtonType.primary
        ? StudentDesignSystem.config.colors.primaryRed
        : StudentDesignSystem.config.colors.primaryRed[50]!;
  }

  Color get buttonTitleColor {
    return type == ButtonType.primary
        ? Colors.white
        : StudentDesignSystem.config.colors.primaryRed;
  }

  Color get buttonDisabledColor => buttonColor.withOpacity(0.48);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: height,
      minWidth: width ?? double.maxFinite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          StudentDesignSystem.config.borderRadius,
        ),
      ),
      color: color ?? buttonColor,
      disabledColor: !isLoading ? buttonDisabledColor : color ?? buttonColor,
      onPressed: !isLoading ? onTap : null,
      child: !isLoading
          ? _buildContent()
          : const Center(
              child: SizedBox(
                height: 8,
                width: 48,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  colors: [
                    Colors.white,
                  ],
                  strokeWidth: 1,
                ),
              ),
            ),
    );
  }

  Widget _buildContent() {
    return leading != null ? _buildWithIcon() : _buildText();
  }

  Widget _buildText() {
    return BoxText.bodyXLargeBold(
      title,
      color: textColor ?? buttonTitleColor,
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
