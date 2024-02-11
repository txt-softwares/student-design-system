import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class StudentEmptyWidget extends StatelessWidget {
  const StudentEmptyWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpaceVertical.x10(),
          const SpaceVertical.x5(),
          StudentPictureWidget.asset(image),
          const SpaceVertical.x8(),
          BoxText.heading4(title),
          const SpaceVertical.x5(),
          BoxText.bodyLargeMedium(
            description,
            align: TextAlign.center,
          ),
          const SpaceVertical.x8(),
        ],
      ),
    );
  }
}
