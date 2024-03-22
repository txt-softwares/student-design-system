import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:student_design_system/student_design_system.dart';

class LearnErrorQuestionWidget extends StatelessWidget {
  const LearnErrorQuestionWidget({
    super.key,
    required this.item,
  });

  final QuizQuestionModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: StudentDesignSystem.config.colors.error[50]!,
      ),
      padding: const EdgeInsets.all(24),
      child: HtmlWidget(
        '<center>${item.expectedAnswer}</center>',
        textStyle: TextStyles.bodyXLargeSemiBold.copyWith(
          color: StudentDesignSystem.config.colors.error,
        ),
      ),
    );
  }
}
