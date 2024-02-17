import 'package:flutter/material.dart';
import '../student_design_system.dart';

class WrongAnswerModalWidget extends StatelessWidget {
  const WrongAnswerModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 264,
      padding: const EdgeInsets.only(
        top: 26,
        left: 26,
        right: 26,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                IconlyBold.closeSquare,
                color: Colors.white,
              ),
              const SpaceHorizontal.x4(),
              BoxText.heading4(
                'Errou :(',
                color: Colors.white,
              ),
            ],
          ),
          const Spacer(),
          BoxText.heading4(
            'Resposta correta:',
            color: Colors.white,
          ),
          const SpaceVertical.x2(),
          BoxText.bodyLargeSemiBold(
            'The restaurant',
            color: Colors.white,
          ),
          const Spacer(),
          StudentButtonWidget(
            title: 'Entendi',
            color: Colors.white,
            textColor: StudentDesignSystem.config.colors.dark,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
