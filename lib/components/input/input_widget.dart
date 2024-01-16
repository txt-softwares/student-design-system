import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_design_system/student_design_system.dart';

class StudentInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? sufix;
  final TextInputType keyboardType;
  final bool isEnabled;

  final String? hintText;
  final bool? obscureText;

  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final Iterable<String>? autofillHints;
  final bool readOnly;
  final TextInputAction? action;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int? lines;
  final AutovalidateMode? autoValidate;
  final FocusNode? focus;

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
    this.prefix,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.hintText,
    this.sufix,
    this.autofillHints,
    this.obscureText,
    this.readOnly = false,
    this.inputFormatters,
    this.action,
    this.onSubmitted,
    this.lines,
    this.autoValidate,
    this.focus,
    Key? key,
  }) : super(key: key);

  final _focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          final FocusNode focusNode = Focus.of(context);
          final bool hasFocus = focusNode.hasFocus;
          return TextFormField(
            focusNode: focus ?? _focus,
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
            cursorColor: StudentDesignSystem.config.colors.primaryPurple[500],
            cursorHeight: 22,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            maxLines: lines,
            style: TextStyles.bodyLargeSemiBold,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 17.0,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  StudentDesignSystem.config.borderRadius,
                ),
                borderSide:
                    BorderSide(color: StudentDesignSystem.config.colors.error),
              ),
              errorStyle:
                  TextStyle(color: StudentDesignSystem.config.colors.error),
              filled: true,
              fillColor: hasFocus
                  ? StudentDesignSystem.config.colors.transparentPurple
                  : StudentDesignSystem.config.colors.dark[50],
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  StudentDesignSystem.config.borderRadius,
                ),
                borderSide: BorderSide(
                  color: StudentDesignSystem.config.colors.primaryPurple[500]!,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  StudentDesignSystem.config.borderRadius,
                ),
              ),
              focusColor: Colors.black,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  StudentDesignSystem.config.borderRadius,
                ),
                borderSide: BorderSide.none,
              ),
              prefixIcon: prefix,
              hintStyle: TextStyles.bodyLargeRegular.copyWith(
                color: StudentDesignSystem.config.colors.darkblue[500]!,
              ),
              hintText: hintText,
              suffixIcon: sufix,
            ),
          );
        },
      ),
    );
  }
}
