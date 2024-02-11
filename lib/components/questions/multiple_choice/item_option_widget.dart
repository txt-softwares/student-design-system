import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class TaskOptionWidget extends StatelessWidget {
  const TaskOptionWidget({
    Key? key,
    required this.option,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final StudentTaskOptionModel option;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          backgroundColor: (isSelected)
              ? StudentDesignSystem.config.colors.primaryPurple[50]!
              : StudentDesignSystem.config.colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                StudentDesignSystem.config.borderRadius,
              ),
              side: BorderSide(
                color: (isSelected)
                    ? StudentDesignSystem.config.colors.primaryPurple[500]!
                    : StudentDesignSystem.config.colors.dark[200]!,
                width: 1,
              )),
        ),
        child: Center(child: BoxText.bodyXLargeBold(option.content)),
      ),
    );
  }
}
