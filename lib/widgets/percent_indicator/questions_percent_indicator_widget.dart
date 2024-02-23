import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../student_design_system.dart';

class QuestionsPercentIndicatorWidget extends StatelessWidget {
  const QuestionsPercentIndicatorWidget({
    super.key,
    required this.totalQuestions,
    required this.finishedQuestions,
  });
  final int totalQuestions;
  final int finishedQuestions;

  @override
  Widget build(BuildContext context) {
    final dsColor = StudentDesignSystem.config.colors;
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 40,
        top: 76,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close_rounded,
              color: dsColor.dark,
            ),
          ),
          Expanded(
            child: LinearPercentIndicator(
              lineHeight: 12,
              percent: finishedQuestions / totalQuestions,
              backgroundColor: dsColor.dark[100],
              progressColor: dsColor.primaryPurple,
              barRadius: const Radius.circular(50),
              padding: const EdgeInsets.symmetric(horizontal: 30),
            ),
          ),
          BoxText.bodyLargeBold('$finishedQuestions/$totalQuestions'),
        ],
      ),
    );
  }
}
