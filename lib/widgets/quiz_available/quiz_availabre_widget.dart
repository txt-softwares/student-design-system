import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_design_system/student_design_system.dart';

class StudentQuizAvailabreWidget extends StatelessWidget {
  const StudentQuizAvailabreWidget({
    super.key,
    required this.name,
    required this.releasedAt,
    required this.onTap,
  });
  final String name;
  final DateTime? releasedAt;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final color = StudentDesignSystem.config.colors;

    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color.primaryPurple[500],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoxText.heading4(
                    'Quiz disponível!',
                    color: Colors.white,
                  ),
                  BoxText.bodyMediumMedium(
                    DateFormat('dd/MM/yyyy').format(releasedAt!),
                    color: StudentDesignSystem.config.colors.primaryPurple[100],
                  ),
                ],
              ),
              const SizedBox(width: 6),
              BoxText.bodyLargeMedium(
                name,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
