import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_design_system/student_design_system.dart';
import '../../components/questions/models/task_model.dart';

class StudentQuizAvailabreWidget extends StatelessWidget {
  const StudentQuizAvailabreWidget({
    super.key,
    required this.data,
  });
  final TaskModel data;

  @override
  Widget build(BuildContext context) {
    final color = StudentDesignSystem.config.colors;

    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/quiz',
            arguments: data.id,
          );
        },
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
                    DateFormat('dd/MM/yyyy').format(data.releasedAt!),
                    color: StudentDesignSystem.config.colors.primaryPurple[100],
                  ),
                ],
              ),
              const SizedBox(width: 6),
              BoxText.bodyLargeMedium(
                data.name,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
