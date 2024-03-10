import 'package:flutter/material.dart';

import '../../../../../config/ds_config.dart';
import '../../../../../typography/box_text.dart';
import '../../../models/quiz_question_model.dart';

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
      child: BoxText.bodyXLargeSemiBold(
        item.expectedAnswer,
        color: StudentDesignSystem.config.colors.error,
        align: TextAlign.center,
      ),
    );
  }
}
