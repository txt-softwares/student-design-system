import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class MatchItemWidget extends StatelessWidget {
  const MatchItemWidget({
    Key? key,
    required this.match,
    required this.onTap,
    required this.isSelected,
    required this.isContent,
    required this.isCorrect,
    required this.isAnswered,
  }) : super(key: key);

  final MatchModel match;
  final Function() onTap;
  final bool isSelected;
  final bool isContent;
  final bool? isCorrect;
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
          isContent ? match.content : match.match,
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
    } else if (isSelected) {
      return isCorrect! ? dsColor.secondaryGreen : dsColor.error[500]!;
    } else {
      return dsColor.white;
    }
  }
}
