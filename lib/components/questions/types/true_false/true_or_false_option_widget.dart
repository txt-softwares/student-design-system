import 'package:flutter/material.dart';
import '../../../../student_design_system.dart';

class TrueOrFalseOptionWidget extends StatelessWidget {
  const TrueOrFalseOptionWidget({
    super.key,
    required this.isTrue,
    required this.onTap,
    required this.isSelected,
  });

  final bool isTrue;
  final Function() onTap;
  final bool isSelected;

  Color changeColor() {
    final dsColor = StudentDesignSystem.config.colors;
    switch (isTrue) {
      case true:
        if (isSelected) {
          return dsColor.secondaryGreen[500]!;
        } else {
          return dsColor.secondaryGreen[50]!;
        }

      case false:
        if (isSelected) {
          return dsColor.primaryRed;
        } else {
          return dsColor.transparentRed;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 224,
        width: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: changeColor(),
          ),
          onPressed: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                isTrue ? 'assets/images/true.png' : 'assets/images/false.png',
                package: 'student_design_system',
              ),
              const SpaceVertical.x6(),
              BoxText.heading5(isTrue ? 'Verdadeiro' : 'Falso'),
            ],
          ),
        ),
      ),
    );
  }
}
