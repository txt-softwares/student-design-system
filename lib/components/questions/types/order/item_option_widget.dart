import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class ReorderOptionWidget extends StatelessWidget {
  const ReorderOptionWidget({
    Key? key,
    required this.option,
  }) : super(key: key);

  final StudentTaskOptionModel option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          backgroundColor: StudentDesignSystem.config.colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                StudentDesignSystem.config.borderRadius,
              ),
              side: BorderSide(
                color: StudentDesignSystem.config.colors.dark[200]!,
                width: 1,
              )),
        ),
        child: Center(child: BoxText.bodyXLargeBold(option.content)),
      ),
    );
  }
}
