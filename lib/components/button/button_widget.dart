import 'package:flutter/material.dart';

import '../../config/ds_config.dart';
import '../../spacing/spacing_size.dart';

class StudentButtonWidget extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool isLoading;
  final void Function()? onTap;
  final bool outline;
  final double height;
  final double? width;
  final Widget? leading;
  final Color? color;
  final Color textColor;

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
    this.color,
    this.width,
    this.textColor = Colors.white,
  })  : outline = false,
        super(key: key);

  const StudentButtonWidget.outline({
    Key? key,
    required this.title,
    this.onTap,
    this.leading,
    this.height = 56,
    this.color,
    this.width,
    this.textColor = Colors.white,
  })  : disabled = false,
        isLoading = false,
        outline = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
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
      color: color ?? StudentDesignSystem.config.colors.primary1,
      disabledColor: StudentDesignSystem.config.colors.primary1,
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
            fontFamily: 'Inter',
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
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
        Center(
          child: _buildText(),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: Spacing.x10),
            child: leading,
          ),
        ),
      ],
    );
  }
}
