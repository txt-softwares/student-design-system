import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class ReorderOptionWidget extends StatelessWidget {
  const ReorderOptionWidget({
    Key? key,
    required this.option,
    required this.index,
  }) : super(key: key);

  final StudentTaskOptionModel option;
  final int index;

  @override
  Widget build(BuildContext context) {
    final dsColor = StudentDesignSystem.config.colors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: dsColor.transparentPurple,
              border: Border.all(color: dsColor.primaryPurple[100]!),
            ),
            child: Center(child: BoxText.bodyXLargeBold('${index + 1}')),
          ),
          const SpaceHorizontal.x4(),
          Expanded(
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  StudentDesignSystem.config.borderRadius,
                ),
                border: Border.all(color: dsColor.dark[200]!),
              ),
              child: Row(
                children: [
                  Expanded(
                    child:
                        Center(child: BoxText.bodyXLargeBold(option.content)),
                  ),
                  Icon(
                    Icons.drag_handle_rounded,
                    color: dsColor.dark[500],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
