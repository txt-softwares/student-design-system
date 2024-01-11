import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class StudentDropDownWidget extends StatefulWidget {
  const StudentDropDownWidget({
    Key? key,
    required this.controller,
    required this.list,
    required this.hintText,
    this.onChanged,
    this.labelText,
  }) : super(key: key);
  final SingleValueDropDownController controller;
  final List<DropDownValueModel> list;
  final String hintText;
  final Function(dynamic)? onChanged;
  final String? labelText;

  @override
  State<StudentDropDownWidget> createState() => _StudentDropDownWidgetState();
}

class _StudentDropDownWidgetState extends State<StudentDropDownWidget> {
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();
  late SingleValueDropDownController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              widget.labelText!,
              style: const TextStyle(
                fontFamily: 'Inter',
              ),
            ),
          ),
        DropDownTextField(
          validator: (value) {
            if (value == null) {
              return 'Selecione um valor';
            }
            if (value.isEmpty) {
              return 'Selecione um valor';
            }
            return null;
          },
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          textFieldDecoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Color(0xFFBCBCBC),
                fontSize: 16,
                fontFamily: 'Inter',
              ),
              enabledBorder: _buildOutlineInputBorder(),
              focusedBorder: _buildOutlineInputBorder(),
              errorBorder: _buildOutlineInputBorder(),
              focusedErrorBorder: _buildOutlineInputBorder()),
          dropDownIconProperty: IconProperty(
            icon: Icons.arrow_downward_outlined,
            size: 20,
            color: Colors.black,
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
        ),
        const SizedBox(height: 14),
      ],
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    );
  }
}
