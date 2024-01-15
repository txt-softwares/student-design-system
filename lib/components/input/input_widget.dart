import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_design_system/config/ds_config.dart';

class StudentInputWidget extends StatefulWidget {
  final bool hasError;
  final GlobalKey? validatorKey;
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
  const StudentInputWidget({
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
    this.validatorKey,
  }) : super(key: key);

  @override
  State<StudentInputWidget> createState() => _StudentInputWidgetState();
}

class _StudentInputWidgetState extends State<StudentInputWidget> {
  FocusNode myFocusNode = FocusNode();
  Color fillnputColor = StudentDesignSystem.config.colors.inputColor;
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              widget.labelText!,
              style: const TextStyle(
                fontFamily: 'Inter',
              ),
            ),
          ),
        Form(
          key: widget.validatorKey,
          child: Focus(child: Builder(builder: (
            BuildContext context,
          ) {
            final FocusNode focusNode = Focus.of(context);
            final bool hasFocus = focusNode.hasFocus;

            return TextFormField(
              focusNode: myFocusNode,
              validator: widget.validator,
              autovalidateMode: widget.autoValidate,
              onChanged: widget.onChanged,
              enabled: widget.isEnabled,
              autofillHints: widget.autofillHints,
              controller: widget.controller,
              textInputAction: widget.action,
              textAlignVertical: TextAlignVertical.center,
              onFieldSubmitted: widget.onSubmitted,
              readOnly: widget.readOnly,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText ?? false,
              maxLines: widget.lines,
              style: TextStyle(
                  color: StudentDesignSystem.config.colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2),
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                contentPadding: widget.hasPadding
                    ? const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 17.0)
                    : null,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        StudentDesignSystem.config.borderRadius),
                    borderSide: BorderSide(
                        color: StudentDesignSystem
                            .config.colors.errorValidatorColor)),
                errorStyle: TextStyle(
                    color:
                        StudentDesignSystem.config.colors.errorValidatorColor),
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
                        StudentDesignSystem.config.borderRadius)),
                focusColor: Colors.black,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        StudentDesignSystem.config.borderRadius),
                    borderSide: BorderSide.none),
                prefixIcon: widget.prefix,
                hintStyle: TextStyle(
                    color: StudentDesignSystem.config.colors.hintColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Urbanist',
                    height: 0.09,
                    letterSpacing: 0.20),
                hintText: widget.hintText,
                suffixIcon: widget.sufix,
              ),
            );
          })),
        ),
      ],
    );
  }
}
