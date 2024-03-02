import 'package:flutter/material.dart';
import '../../../../student_design_system.dart';

class IndexListWidget extends StatelessWidget {
  const IndexListWidget({
    super.key,
    required this.reorderedItems,
  });
  final List<StudentTaskOptionModel> reorderedItems;

  @override
  Widget build(BuildContext context) {
    final dsColor = StudentDesignSystem.config.colors;

    return SizedBox(
      width: 72,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(right: 16),
        itemBuilder: (context, index) => Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: dsColor.transparentPurple,
            border: Border.all(
              color: dsColor.primaryPurple[100]!,
            ),
          ),
          child: Center(child: BoxText.bodyXLargeBold('${index + 1}')),
        ),
        separatorBuilder: (context, index) => const SpaceVertical.x4(),
        itemCount: reorderedItems.length,
      ),
    );
  }
}
