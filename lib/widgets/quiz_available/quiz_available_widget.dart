import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_design_system/student_design_system.dart';

class StudentQuizAvailableWidget extends StatelessWidget {
  const StudentQuizAvailableWidget({
    super.key,
    required this.name,
    required this.releasedAt,
    required this.onTap,
    required this.quizavailable,
    required this.postsQuantity,
    required this.icon,
  });
  final String name;
  final DateTime? releasedAt;
  final Function() onTap;
  final bool quizavailable;
  final int postsQuantity;
  final String icon;

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
        child: Column(
          children: [
            Container(
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
                    children: [
                      StudentPictureWidget.asset(icon),
                      const SizedBox(width: 6),
                      BoxText.bodyLargeSemiBold(
                        'Mural da turma',
                        color: Colors.white,
                      ),
                      const Spacer(),
                      !quizavailable
                          ? const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 20,
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    StudentDesignSystem.config.colors.dark[900],
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: BoxText.bodySmallSemiBold(
                                '$postsQuantity novos posts',
                                color: Colors.white,
                              ),
                            ),
                    ],
                  ),
                  if (quizavailable)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoxText.heading4(
                              'Quiz disponível!',
                              color: Colors.white,
                            ),
                            BoxText.bodyMediumMedium(
                              DateFormat('dd/MM/yyyy').format(releasedAt!),
                              color: StudentDesignSystem
                                  .config.colors.primaryPurple[100],
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
