import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_design_system/student_design_system.dart';

class CardCounterWidget extends StatefulWidget {
  const CardCounterWidget({
    super.key,
    required this.counterCardsUnlearned,
    required this.counterCardsLearned,
    required this.showLabel,
  });
  final int counterCardsLearned;
  final int counterCardsUnlearned;
  final bool showLabel;

  @override
  State<CardCounterWidget> createState() => _CardCounterWidgetState();
}

class _CardCounterWidgetState extends State<CardCounterWidget> {
  final dsColor = StudentDesignSystem.config.colors;
  final Random random = Random();
  final List<Widget> labelList = [
    _buildFirstLabel(),
    _buildSecondLabel(),
  ];

  @override
  Widget build(BuildContext context) {
    int randomIndex = random.nextInt(labelList.length);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCounterBox(
            widget.counterCardsUnlearned,
            dsColor.primaryRed,
            const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          const SpaceHorizontal.x2(),
          labelList[randomIndex],
          const SpaceHorizontal.x2(),
          _buildCounterBox(
            widget.counterCardsLearned,
            dsColor.secondaryGreen,
            const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterBox(int count, Color color, BorderRadius borderRadius) {
    return Container(
      height: 64,
      width: 56,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Center(
        child: BoxText.bodyXLargeBold(
          '$count',
          color: StudentDesignSystem.config.colors.white,
        ),
      ),
    );
  }
}

Flexible _buildSecondLabel() {
  final dsColor = StudentDesignSystem.config.colors;
  return Flexible(
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: dsColor.dark[700],
        ),
        children: [
          const TextSpan(
            text: 'Arraste para a esquerda se ainda estiver',
          ),
          TextSpan(
            text: ' aprendendo',
            style: TextStyle(
              color: dsColor.primaryRed,
            ),
          ),
        ],
      ),
    ),
  );
}

Flexible _buildFirstLabel() {
  final dsColor = StudentDesignSystem.config.colors;
  return Flexible(
    child: RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: dsColor.dark[700],
        ),
        children: [
          const TextSpan(
            text: 'Arraste para a direita se tiver',
          ),
          TextSpan(
            text: ' aprendido',
            style: TextStyle(
              color: dsColor.secondaryGreen[700],
            ),
          ),
          const TextSpan(
            text: ' o cartão',
          ),
        ],
      ),
    ),
  );
}
