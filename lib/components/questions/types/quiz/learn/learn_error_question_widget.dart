import 'package:cached_network_image/cached_network_image.dart';
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
      child: item.file != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(imageUrl: item.file!),
            )
          : HtmlWidget(
              '<center>${item.content}</center>',
              textStyle: TextStyles.bodyXLargeSemiBold.copyWith(
                color: StudentDesignSystem.config.colors.error,
              ),
            ),
    );
  }
}
