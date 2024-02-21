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
    final dsColor = StudentDesignSystem.config.colors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          backgroundColor:
              (isSelected) ? dsColor.primaryPurple[50]! : dsColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              StudentDesignSystem.config.borderRadius,
            ),
            side: BorderSide(
              color: (isSelected)
                  ? dsColor.primaryPurple[500]!
                  : dsColor.dark[200]!,
            ),
          ),
        ),
        child: Center(
          child: BoxText.bodyXLargeBold(option.content),
        ),
      ),
    );
  }
}
