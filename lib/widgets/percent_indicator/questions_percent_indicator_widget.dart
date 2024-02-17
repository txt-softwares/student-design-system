import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../student_design_system.dart';

class QuestionsPercentIndicatorWidget extends StatelessWidget {
  const QuestionsPercentIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dsColor = StudentDesignSystem.config.colors;
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.close_rounded,
                color: dsColor.dark,
              ),
            ),
            Expanded(
              child: LinearPercentIndicator(
                lineHeight: 12,
                percent: 0.1,
                backgroundColor: dsColor.dark[100],
                progressColor: dsColor.primaryPurple,
                barRadius: const Radius.circular(50),
                padding: const EdgeInsets.symmetric(horizontal: 30),
              ),
            ),
            BoxText.bodyLargeBold('1/10'),
          ],
        ),
        const SpaceVertical.x10(),
      ],
    );
  }
}
