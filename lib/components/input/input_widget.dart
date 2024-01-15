import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_design_system/config/ds_config.dart';

class StudentInputWidget extends StatelessWidget {
  final bool hasError;
  final TextEditingController controller;
  final Widget? prefix;

  final Widget? sufix;
  final TextInputType keyboardType;
  final bool isEnabled;
  final bool hasBorder;

  final String? hintText;
  final bool? obscureText;

  final String? labelText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final Iterable<String>? autofillHints;
  final bool readOnly;
  final TextInputAction? action;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int? lines;
  final AutovalidateMode? autoValidate;
  final TextAlign align;
  final bool hasPadding;

  /// FormInput
  ///
  /// [controller] form controller
  ///
  /// [prefix] is a prefix of input will be rendered on left side of input
  ///
  /// [type] type of text input
  ///
  /// [isEnable] is a bool that will be check if formInput is active
  ///
  /// [validator] function that validate input
  ///
  /// [onChanged] onChanged of formInput
  StudentInputWidget({
    required this.controller,
    this.isEnabled = true,
    this.hasBorder = true,
    this.prefix,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.hintText,
    this.sufix,
    this.autofillHints,
    this.labelText,
    this.obscureText,
    this.readOnly = false,
    this.inputFormatters,
    this.action,
    this.hasError = false,
    this.onSubmitted,
    this.lines,
    this.autoValidate,
    this.align = TextAlign.left,
    this.hasPadding = true,
    Key? key,
  }) : super(key: key);

  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              labelText!,
              style: const TextStyle(
                fontFamily: 'Inter',
              ),
            ),
          ),
        Focus(
          child: Builder(builder: (
            BuildContext context,
          ) {
            final FocusNode focusNode = Focus.of(context);
            final bool hasFocus = focusNode.hasFocus;

            return TextFormField(
              focusNode: myFocusNode,
              validator: validator,
              autovalidateMode: autoValidate,
              onChanged: onChanged,
              enabled: isEnabled,
              autofillHints: autofillHints,
              controller: controller,
              textInputAction: action,
              textAlignVertical: TextAlignVertical.center,
              onFieldSubmitted: onSubmitted,
              readOnly: readOnly,
              inputFormatters: inputFormatters,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              maxLines: lines,
              style: TextStyle(
                  color: StudentDesignSystem.config.colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2),
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                contentPadding: hasPadding
                    ? const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 17.0)
                    : null,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      StudentDesignSystem.config.borderRadius),
                  borderSide: BorderSide(
                      color: StudentDesignSystem.config.colors.error),
                ),
                errorStyle:
                    TextStyle(color: StudentDesignSystem.config.colors.error),
                filled: true,
                fillColor: hasFocus
                    ? StudentDesignSystem.config.colors.focusInputColor
                        .withOpacity(0.08)
                    : StudentDesignSystem.config.colors.inputColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      StudentDesignSystem.config.borderRadius),
                  borderSide: BorderSide(
                    color: StudentDesignSystem.config.colors.focusInputColor,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      StudentDesignSystem.config.borderRadius),
                ),
                focusColor: Colors.black,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        StudentDesignSystem.config.borderRadius),
                    borderSide: BorderSide.none),
                prefixIcon: prefix,
                hintStyle: TextStyle(
                    color: StudentDesignSystem.config.colors.hintColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Urbanist',
                    height: 0.09,
                    letterSpacing: 0.20),
                hintText: hintText,
                suffixIcon: sufix,
              ),
            );
          }),
        ),
      ],
    );
  }
}
