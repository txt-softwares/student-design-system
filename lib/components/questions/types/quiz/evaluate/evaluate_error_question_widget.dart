import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../../student_design_system.dart';

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
                      child: StudentPictureWidget.network(item.file!),
                    )
                  : Center(
                      child: HtmlWidget(
                        '<center>${item.content}</center>',
                        textStyle: TextStyles.heading4,
                      ),
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
