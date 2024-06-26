import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class StudentFailureWidget extends StatelessWidget {
  const StudentFailureWidget({
    super.key,
    required this.title,
    required this.description,
    required this.reload,
    required this.back,
    required this.image,
    required this.backToStartMessage,
    required this.reloadMessage,
  });
  final String title;
  final String description;
  final String image;
  final Function() reload;
  final Function() back;
  final String reloadMessage;
  final String backToStartMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StudentPictureWidget.asset(image),
          const SpaceVertical.x8(),
          const SpaceVertical.x8(),
          BoxText.heading3(title),
          const SpaceVertical.x5(),
          BoxText.bodyXLargeMedium(description),
          const SpaceVertical.x8(),
          const SpaceVertical.x8(),
          StudentButtonWidget(
            title: reloadMessage,
            onTap: reload,
          ),
          const SpaceVertical.x4(),
          StudentButtonWidget.secoundary(
            title: backToStartMessage,
            onTap: back,
          ),
          const SpaceVertical.x8(),
        ],
      ),
    );
  }
}
