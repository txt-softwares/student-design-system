import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_design_system/config/ds_config.dart';


class StudentInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final IconData? prefix;

  final IconData? sufix;
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
    this.onSubmitted,
    this.lines,
    this.autoValidate,
    this.align = TextAlign.left,
    this.hasPadding = false,
    Key? key,
  }) : super(key: key);

  @override
  State<StudentInputWidget> createState() => _StudentInputWidgetState();
}

class _StudentInputWidgetState extends State<StudentInputWidget> {
  FocusNode myFocusNode = FocusNode();
  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myFocusNode.addListener(() {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  Color get isFocusColor {
    return myFocusNode.hasFocus
        ? StudentDesignSystem.config.colors.focusInputColor
        : StudentDesignSystem.config.colors.hintColor;
  }

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
        TextFormField(
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
            color: StudentDesignSystem.config.colors.hintColor,
            fontSize: 20,
          ),
          textAlign: widget.align,
          decoration: InputDecoration(
            filled: true,
            fillColor: StudentDesignSystem.config.colors.inputColor,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  8.0), // Cantos arredondados quando focado
              borderSide: BorderSide(
                color: StudentDesignSystem.config.colors
                    .focusInputColor, // Cor da borda quando focado
              ), // Cor da borda quando focado
            ),
            focusColor: Colors.black,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Cantos arredondados
                borderSide: BorderSide.none),
            prefixIcon: Icon(widget.prefix, color: isFocusColor),
            hintStyle: TextStyle(
                color: StudentDesignSystem.config.colors.hintColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: 'Urbanist',
                height: 0.09,
                letterSpacing: 0.20),
            hintText: widget.hintText,
            suffixIcon: Icon(
              widget.sufix,
              color: isFocusColor,
            ),
          ),
          // decoration: InputDecoration(
          //   fillColor: StudentDesignSystem.config.colors.inputColor,
          //   contentPadding: hasPadding
          //       ? const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0)
          //       : null,
          //   border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8.0), // Cantos arredondados
          //       borderSide: BorderSide(
          //         color: StudentDesignSystem.config.colors.inputColor,
          //       )),
          //   //TODO
          //   //T InputBorderType.getBorder(hasBorder),
          //   enabledBorder: InputBorderType.getBorder(hasBorder),
          //   disabledBorder: InputBorderType.getBorder(hasBorder),
          //   focusedBorder: InputBorderType.getBorder(hasBorder),
          //   errorBorder: InputBorderType.getBorder(hasBorder),
          //   focusedErrorBorder: InputBorderType.getBorder(hasBorder),
          //   labelStyle: const TextStyle(
          //     color: Color(0xff4f4f4f),
          //     fontSize: 14,
          //   ),

          // ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
