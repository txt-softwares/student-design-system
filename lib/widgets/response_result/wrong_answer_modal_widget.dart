import 'package:flutter/material.dart';
import '../../student_design_system.dart';

class WrongAnswerModalWidget extends StatelessWidget {
  const WrongAnswerModalWidget({
    super.key,
    required this.title,
    required this.correctAnswer,
    required this.rightAnswerMessage,
    required this.buttonTitle,
    this.onContinue,
    this.isLoading = false,
  });

  final String title;
  final String? correctAnswer;
  final String rightAnswerMessage;
  final String buttonTitle;
  final Function()? onContinue;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
      padding: const EdgeInsets.only(
        top: 26,
        left: 26,
        right: 26,
        bottom: 37,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                IconlyBold.closeSquare,
                color: Colors.white,
              ),
              const SpaceHorizontal.x4(),
              BoxText.heading4(
                title,
                color: Colors.white,
              ),
            ],
          ),
          if (correctAnswer != null) const Spacer(),
          if (correctAnswer != null)
            BoxText.heading4(
              rightAnswerMessage,
              color: Colors.white,
            ),
          const SpaceVertical.x2(),
          if (correctAnswer == null) const SpaceVertical.x8(),
          if (correctAnswer != null)
            BoxText.bodyLargeSemiBold(
              correctAnswer!,
              color: Colors.white,
            ),
          if (correctAnswer != null) const Spacer(),
          StudentButtonWidget(
            title: buttonTitle,
            color: Colors.white,
            isLoading: isLoading,
            textColor: StudentDesignSystem.config.colors.dark,
            onTap: onContinue,
          ),
        ],
      ),
    );
  }
}
