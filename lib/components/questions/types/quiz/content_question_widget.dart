import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
            : _buildWithText(),
      ),
    );
  }

  Container _buildWithText() {
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
      child: BoxText.heading4(
        text ?? '',
        align: TextAlign.center,
        color: StudentDesignSystem.config.colors.white,
      ),
    );
  }
}
