import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class CombineItemWidget extends StatelessWidget {
  const CombineItemWidget({
    Key? key,
    required this.match,
    required this.onTap,
    required this.isSelected,
    required this.isCorrect,
    required this.isAnswered,
  }) : super(key: key);

  final QuizQuestionModel match;
  final Function() onTap;
  final bool isSelected;
  final bool? isCorrect;
  final bool isAnswered;

  @override
  Widget build(BuildContext context) {
    final dsColor = StudentDesignSystem.config.colors;

    return ElevatedButton(
      onPressed: isAnswered ? null : onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: match.file != null && !match.answerInCombine ? 0 : 10,
        ),
        backgroundColor: backgroundColor,
        disabledBackgroundColor: dsColor.dark[100]!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor),
        ),
      ),
      child: isAnswered
          ? Container()
          : match.file != null && !match.answerInCombine
              ? CachedNetworkImage(imageUrl: match.file!)
              : Center(
                  child: BoxText.bodyLargeSemiBold(
                    match.answerInCombine
                        ? match.expectedAnswer
                        : match.content ?? '',
                    align: TextAlign.center,
                  ),
                ),
    );
  }

  Color get backgroundColor {
    final dsColor = StudentDesignSystem.config.colors;

    if (isCorrect == null) {
      return isSelected ? dsColor.primaryPurple[50]! : dsColor.white;
    } else if (isSelected) {
      return isCorrect! ? dsColor.secondaryGreen[50]! : dsColor.error[50]!;
    } else {
      return dsColor.white;
    }
  }

  Color get borderColor {
    final dsColor = StudentDesignSystem.config.colors;

    if (isCorrect == null) {
      return isSelected
          ? dsColor.primaryPurple[500]!
          : dsColor.dark[isAnswered ? 100 : 200]!;
    } else if (isSelected) {
      return isCorrect! ? dsColor.secondaryGreen[700]! : dsColor.error[500]!;
    } else {
      return dsColor.dark[isAnswered ? 100 : 200]!;
    }
  }
}
