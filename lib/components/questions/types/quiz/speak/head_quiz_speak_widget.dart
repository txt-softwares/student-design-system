import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:student_design_system/student_design_system.dart';

class HeadQuizSpeakWidget extends StatelessWidget {
  const HeadQuizSpeakWidget({
    super.key,
    this.title,
    this.file,
  });

  final String? title;
  final String? file;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: StudentDesignSystem.config.colors.dark[200]!,
        ),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: file != null
              ? StudentPictureWidget.network(
                  file!,
                  fit: BoxFit.cover,
                )
              : Container(
                  width: double.maxFinite,
                  color: StudentDesignSystem.config.colors.primaryPurple,
                  padding: const EdgeInsets.all(16),
                  child: HtmlWidget(
                    title!,
                    textStyle: TextStyles.heading4.copyWith(
                      color: StudentDesignSystem.config.colors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
