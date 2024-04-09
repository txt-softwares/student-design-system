import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class StudentModalWidget extends StatelessWidget {
  const StudentModalWidget({
    super.key,
    required this.title,
    required this.description,
    required this.confirmTitle,
    this.cancelTitle,
    required this.onConfirm,
    this.onCancel,
    this.titleColor,
  });
  final String title;
  final String description;
  final String confirmTitle;
  final String? cancelTitle;
  final Function() onConfirm;
  final Function()? onCancel;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.only(
        top: 8,
        left: 24,
        right: 24,
        bottom: 24,
      ),
      child: Column(
        children: [
          Container(
            height: 3,
            width: 38,
            decoration: BoxDecoration(
              color: StudentDesignSystem.config.colors.dark[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SpaceVertical.x8(),
          BoxText.heading4(
            title,
            color: titleColor ?? StudentDesignSystem.config.colors.primaryRed,
          ),
          const SpaceVertical.x6(),
          Divider(
            height: 0,
            color: StudentDesignSystem.config.colors.dark[300],
          ),
          const SpaceVertical.x6(),
          BoxText.bodyXLargeSemiBold(
            description,
            align: TextAlign.center,
          ),
          const SpaceVertical.x6(),
          Row(
            children: [
              if (cancelTitle != null)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: StudentButtonWidget(
                      title: cancelTitle ?? '',
                      onTap: onCancel,
                      color: StudentDesignSystem.config.colors.primaryRed[50],
                      textColor: StudentDesignSystem.config.colors.primaryRed,
                    ),
                  ),
                ),
              Expanded(
                child: StudentButtonWidget(
                  title: confirmTitle,
                  onTap: onConfirm,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
