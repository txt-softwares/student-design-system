import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../config/ds_config.dart';
import '../../../../../typography/box_text.dart';
import '../../../models/quiz_question_model.dart';

class EvaluateErrorQuestionWidget extends StatelessWidget {
  const EvaluateErrorQuestionWidget({
    super.key,
    required this.item,
  });

  final QuizQuestionModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: StudentDesignSystem.config.colors.error[100]!),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.all(24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: item.file != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 72),
                      child: CachedNetworkImage(imageUrl: item.file!),
                    )
                  : Center(
                      child: BoxText.heading4(item.content ?? ''),
                    ),
            ),
          ),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16).copyWith(
                topLeft: Radius.zero,
                topRight: Radius.zero,
              ),
              color: StudentDesignSystem.config.colors.error[50]!,
            ),
            padding: const EdgeInsets.all(24),
            child: BoxText.bodyXLargeSemiBold(
              item.expectedAnswer,
              color: StudentDesignSystem.config.colors.error,
              align: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
