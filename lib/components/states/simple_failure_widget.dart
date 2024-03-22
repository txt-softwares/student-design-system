import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class SimpleStudentFailureWidget extends StatelessWidget {
  const SimpleStudentFailureWidget({
    super.key,
    required this.title,
    required this.description,
    required this.reload,
    required this.image,
    required this.reloadMessage,
  });
  final String title;
  final String description;
  final String image;
  final Function() reload;
  final String reloadMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: StudentPictureWidget.asset(image),
          ),
          const SpaceVertical.x8(),
          BoxText.heading4(
            title,
            align: TextAlign.center,
          ),
          const SpaceVertical.x5(),
          BoxText.bodySmallMidium(
            description,
            align: TextAlign.center,
          ),
          const SpaceVertical.x8(),
          StudentButtonWidget(
            title: reloadMessage,
            onTap: reload,
          ),
          const SpaceVertical.x8(),
        ],
      ),
    );
  }
}
