import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

import '../../shared/link_to_file_widget.dart';

class HeadTrueOrFalseWidget extends StatelessWidget {
  const HeadTrueOrFalseWidget({
    super.key,
    required this.image,
    required this.title,
    this.file,
  });

  final String title;
  final String? file;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          package: 'student_design_system',
        ),
        const SizedBox(height: 48),
        BoxText.heading5(
          title,
          align: TextAlign.center,
        ),
        if (file != null)
          Column(
            children: [
              const SpaceVertical.x6(),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    StudentDesignSystem.config.borderRadius,
                  ),
                  border: Border.all(
                    color: StudentDesignSystem.config.colors.dark[200]!,
                  ),
                ),
                child: LinkToFileContentWidget(link: file!),
              ),
            ],
          ),
        SizedBox(height: file != null ? 24 : 48),
      ],
    );
  }
}
