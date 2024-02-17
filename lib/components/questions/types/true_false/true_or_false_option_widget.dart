import 'package:flutter/material.dart';
import '../../../../student_design_system.dart';

class TrueOrFalseOptionWidget extends StatelessWidget {
  const TrueOrFalseOptionWidget({
    super.key,
    required this.isTrue,
    required this.onTap,
  });

  final bool isTrue;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final dsColor = StudentDesignSystem.config.colors;

    return Expanded(
      child: SizedBox(
        height: 224,
        width: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor:
                isTrue ? dsColor.secondaryGreen[50] : dsColor.transparentRed,
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
