import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class FlipCardItemWidget extends StatelessWidget {
  const FlipCardItemWidget({
    super.key,
    required this.child,
    required this.showLabel,
  });
  final Widget child;
  final bool showLabel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 32,
            bottom: 32,
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: StudentDesignSystem.config.colors.dark[200]!,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: StudentDesignSystem.config.colors.dark[100]!,
              ),
            ],
            color: StudentDesignSystem.config.colors.white,
          ),
          child: Center(
            child: child,
          ),
        ),
        if (showLabel)
          Positioned(
            bottom: 30,
            left: MediaQuery.of(context).size.width / 5,
            child: BoxText.bodyLargeMedium(
              'Toque no cartão para virar',
              color: StudentDesignSystem.config.colors.dark[500],
            ),
          ),
      ],
    );
  }
}
