import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/models/match_model.dart';
import 'package:student_design_system/student_design_system.dart';

class MatchItemWidget extends StatelessWidget {
  const MatchItemWidget({
    Key? key,
    required this.match,
    required this.onTap,
    required this.isSelected,
    required this.isContent,
  }) : super(key: key);

  final MatchModel match;
  final Function() onTap;
  final bool isSelected;
  final bool isContent;

  @override
  Widget build(BuildContext context) {
    final dsColor = StudentDesignSystem.config.colors;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: SizedBox(
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 20,
            ),
            backgroundColor: isContent
                ? isSelected
                    ? dsColor.primaryPurple
                    : dsColor.white
                : isSelected
                    ? dsColor.secondaryGreen
                    : dsColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: isSelected
                  ? BorderSide.none
                  : BorderSide(color: dsColor.dark[200]!),
            ),
          ),
          child: Center(
            child: BoxText.bodyXLargeBold(
              isContent ? match.content : match.match,
              color: isSelected ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
