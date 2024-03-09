import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:student_design_system/student_design_system.dart';

class QuizLoadingWidget extends StatelessWidget {
  const QuizLoadingWidget({
    super.key,
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 140,
          child: StudentPictureWidget.asset(
            icon,
          ),
        ),
        const SpaceVertical.x10(),
        const SpaceVertical.x2(),
        BoxText.heading3('Carregando resultados...'),
        const SpaceVertical.x8(),
        SizedBox(
          height: 8,
          width: 48,
          child: LoadingIndicator(
            indicatorType: Indicator.ballPulse,
            colors: [StudentDesignSystem.config.colors.primaryPurple],
            strokeWidth: 1,
          ),
        ),
      ],
    );
  }
}
