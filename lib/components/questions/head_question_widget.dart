import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

import 'shared/link_to_file_widget.dart';

class HeadQuestionWidget extends StatelessWidget {
  const HeadQuestionWidget({
    super.key,
    this.title,
    this.file,
  });

  final String? title;
  final String? file;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null) BoxText.heading4(title!),
        const SpaceVertical.x6(),
        Divider(
          color: StudentDesignSystem.config.colors.darkblue[200],
          height: 1,
        ),
        const SpaceVertical.x6(),
        if (file != null)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  StudentDesignSystem.config.borderRadius),
              border: Border.all(
                width: 1,
                color: StudentDesignSystem.config.colors.dark[200]!,
              ),
            ),
            child: LinkToFileContentWidget(link: file!),
          ),
        if (file != null) const SpaceVertical.x6(),
      ],
    );
  }
}
