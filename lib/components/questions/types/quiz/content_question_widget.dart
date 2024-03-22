import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:student_design_system/student_design_system.dart';

class ContentQuestionWidget extends StatelessWidget {
  const ContentQuestionWidget({
    super.key,
    required this.file,
    required this.text,
  });
  final String? file;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: StudentDesignSystem.config.colors.dark[200]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: file != null
            ? CachedNetworkImage(imageUrl: file!)
            : QuizTextAnswerWidget(text: text),
      ),
    );
  }
}

class QuizTextAnswerWidget extends StatelessWidget {
  const QuizTextAnswerWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 48,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: text != null
            ? StudentDesignSystem.config.colors.primaryPurple
            : null,
      ),
      child: HtmlWidget(
        '<center>${text ?? ''}</center>',
        textStyle: TextStyle(
          color: StudentDesignSystem.config.colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
