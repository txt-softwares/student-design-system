import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/models/quiz_question_model.dart';
import 'package:student_design_system/student_design_system.dart';

class CombineItemWidget extends StatelessWidget {
  const CombineItemWidget({
    Key? key,
    required this.match,
    required this.onTap,
    required this.isSelected,
    required this.isCorrect,
    required this.selectdItem,
    required this.isAnswered,
  }) : super(key: key);

  final QuizQuestionModel match;
  final Function() onTap;
  final bool isSelected;
  final bool? isCorrect;
  final int? selectdItem;
  final bool isAnswered;

  @override
  Widget build(BuildContext context) {
    final dsColor = StudentDesignSystem.config.colors;

    return ElevatedButton(
      onPressed: isAnswered ? null : onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 20,
        ),
        backgroundColor: backgroundColor,
        disabledBackgroundColor: dsColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: isSelected
              ? BorderSide.none
              : BorderSide(color: dsColor.dark[isAnswered ? 100 : 200]!),
        ),
      ),
      child: Center(
        child: BoxText.bodyXLargeBold(
          match.answerInCombine ? match.expectedAnswer : match.content ?? '',
          color: isAnswered
              ? dsColor.dark[400]
              : isSelected
                  ? Colors.white
                  : null,
        ),
      ),
    );
  }

  Color get backgroundColor {
    final dsColor = StudentDesignSystem.config.colors;
    if (isCorrect == null) {
      return isSelected ? dsColor.primaryPurple : dsColor.white;
    } else if (selectdItem == match.id) {
      return isCorrect! ? dsColor.secondaryGreen : dsColor.error[500]!;
    } else {
      return dsColor.white;
    }
  }
}
