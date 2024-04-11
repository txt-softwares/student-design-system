import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_design_system/student_design_system.dart';

class StudentQuizAvailableWidget extends StatelessWidget {
  const StudentQuizAvailableWidget({
    super.key,
    required this.name,
    required this.releasedAt,
    required this.openQuiz,
    required this.openMural,
    required this.icon,
    required this.postsAmount,
  });
  final String name;
  final DateTime? releasedAt;
  final Function() openQuiz;
  final Function() openMural;
  final String icon;
  final int? postsAmount;

  @override
  Widget build(BuildContext context) {
    final color = StudentDesignSystem.config.colors;

    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
      ),
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
                InkWell(
                  onTap: openMural,
                  child: Row(
                    children: [
                      StudentPictureWidget.asset(icon),
                      const SizedBox(width: 6),
                      BoxText.bodyLargeSemiBold(
                        'Mural da turma',
                        color: Colors.white,
                      ),
                      const Spacer(),
                      postsAmount != null
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: color.dark,
                              ),
                              child: BoxText.bodySmallSemiBold(
                                postsAmount! > 1
                                    ? '$postsAmount novos posts'
                                    : '$postsAmount novo post',
                                color: color.white,
                              ),
                            )
                          : const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: openQuiz,
                  child: Column(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
