import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:student_design_system/student_design_system.dart';
import '../../../widgets/percent_indicator/questions_percent_indicator_widget.dart';
import 'link_to_file_widget.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const QuestionsPercentIndicatorWidget(),
        if (title != null) BoxText.heading4(title!),
        const SpaceVertical.x6(),
        Divider(
          color: StudentDesignSystem.config.colors.darkblue[200],
          height: 1,
        ),
        const SpaceVertical.x6(),
        if (file != null)
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
        if (file != null) const SpaceVertical.x6(),
      ],
    );
  }

  Row _buildPercentIndicator(StudentDSColors dsColor) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Icon(
            Icons.close_rounded,
            color: dsColor.dark,
          ),
        ),
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: 12,
            percent: 0.1,
            backgroundColor: dsColor.dark[100],
            progressColor: dsColor.primaryPurple,
            barRadius: const Radius.circular(50),
            padding: const EdgeInsets.symmetric(horizontal: 30),
          ),
        ),
        BoxText.bodyLargeBold('1/10'),
      ],
    );
  }
}
