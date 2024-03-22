import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class QuizLearnModalWidget extends StatelessWidget {
  const QuizLearnModalWidget({
    super.key,
    required this.content,
  });
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.only(
        top: 8,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 3,
                  width: 38,
                  decoration: BoxDecoration(
                    color: StudentDesignSystem.config.colors.dark[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SpaceVertical.x8(),
                BoxText.heading4(
                  'A resposta é:',
                  color: StudentDesignSystem.config.colors.primaryRed,
                ),
                const SpaceVertical.x6(),
                Divider(
                  height: 0,
                  color: StudentDesignSystem.config.colors.dark[300],
                ),
                const SpaceVertical.x6(),
                BoxText.bodyXLargeSemiBold(
                  content,
                  align: TextAlign.center,
                ),
                const SpaceVertical.x6(),
              ],
            ),
          ),
          StudentButtonWidget(
            title: 'Ok, entendi!',
            onTap: () async {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
