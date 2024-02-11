import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:student_design_system/config/ds_config.dart';
import 'package:student_design_system/typography/text_styles.dart';

class StudentDropDownWidget extends StatefulWidget {
  const StudentDropDownWidget({
    super.key,
    required this.controller,
    required this.list,
    required this.hintText,
    this.onChanged,
  });
  final SingleValueDropDownController controller;
  final List<DropDownValueModel> list;
  final String hintText;
  final Function(dynamic)? onChanged;

  @override
  State<StudentDropDownWidget> createState() => _StudentDropDownWidgetState();
}

class _StudentDropDownWidgetState extends State<StudentDropDownWidget> {
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController controller;

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Selecione um valor';
        }
        return null;
      },
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      textFieldDecoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 17.0,
        ),
        filled: true,
        fillColor: StudentDesignSystem.config.colors.dark[50],
        hintText: widget.hintText,
        hintStyle: TextStyles.bodyLargeRegular.copyWith(
          color: StudentDesignSystem.config.colors.dark[500]!,
        ),
        enabledBorder: _buildOutlineInputBorder(),
        focusedBorder: _buildOutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(StudentDesignSystem.config.borderRadius),
          borderSide:
              BorderSide(color: StudentDesignSystem.config.colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(StudentDesignSystem.config.borderRadius),
        ),
        errorStyle: TextStyle(color: StudentDesignSystem.config.colors.error),
      ),
      dropDownIconProperty: IconProperty(
        icon: Icons.arrow_drop_down_rounded,
        size: 35,
        color: StudentDesignSystem.config.colors.dark[500],
      ),
      clearIconProperty: IconProperty(
        icon: Icons.close,
        size: 20,
      ),
      readOnly: true,
      controller: widget.controller,
      clearOption: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      dropDownItemCount: widget.list.length,
      dropDownList: widget.list,
      onChanged: widget.onChanged,
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
