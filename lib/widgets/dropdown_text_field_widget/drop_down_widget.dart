import 'package:flutter/material.dart';
import 'package:student_design_system/config/ds_config.dart';
import 'package:student_design_system/typography/text_styles.dart';

class StudentDropDownWidget extends StatefulWidget {
  const StudentDropDownWidget({
    super.key,
    required this.list,
    required this.hintText,
    this.onChanged,
    this.validator,
  });
  final List<String> list;
  final String hintText;
  final Function(dynamic)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<StudentDropDownWidget> createState() => _StudentDropDownWidgetState();
}

class _StudentDropDownWidgetState extends State<StudentDropDownWidget> {
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  String? value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        items: widget.list
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ),
            )
            .toList(),
        onChanged: (newValue) {
          setState(() => value = newValue);
        },
        validator: widget.validator,
        value: value,
        decoration: InputDecoration(
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
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
