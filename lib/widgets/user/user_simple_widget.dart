import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class UserSimpleWidget extends StatelessWidget {
  const UserSimpleWidget({
    super.key,
    required this.name,
    this.imageUrl,
  });
  final String name;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (imageUrl != null)
          StudentPictureWidget.circle(
            imageUrl!,
            height: 26,
            width: 26,
          ),
        if (imageUrl != null) const SizedBox(width: 10),
        BoxText.bodyLargeSemiBold(
          name,
          align: TextAlign.start,
        ),
      ],
    );
  }
}
