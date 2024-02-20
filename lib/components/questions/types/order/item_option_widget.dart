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
            decoration: _buildBoxDecoration(dsColor),
            child: Center(child: BoxText.bodyXLargeBold('${index + 1}')),
          ),
          const SpaceHorizontal.x4(),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: _buildButtonStyle(dsColor),
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

  BoxDecoration _buildBoxDecoration(StudentDSColors dsColor) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: dsColor.transparentPurple,
      border: Border.all(color: dsColor.primaryPurple[100]!),
    );
  }

  ButtonStyle _buildButtonStyle(StudentDSColors dsColor) {
    return ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      backgroundColor: dsColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          StudentDesignSystem.config.borderRadius,
        ),
        side: BorderSide(color: dsColor.dark[200]!),
      ),
    );
  }
}
