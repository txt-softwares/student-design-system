import 'package:flutter/material.dart';
import '../../student_design_system.dart';

class CorrectAnswerModalWidget extends StatelessWidget {
  const CorrectAnswerModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 178,
      padding: const EdgeInsets.only(
        top: 26,
        left: 26,
        right: 26,
        bottom: 37,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(IconlyBold.tickSquare),
              const SpaceHorizontal.x4(),
              BoxText.heading4('Uhul! Correto!'),
            ],
          ),
          const Spacer(),
          StudentButtonWidget(
            title: 'Continuar',
            color: Colors.white,
            textColor: StudentDesignSystem.config.colors.dark,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
