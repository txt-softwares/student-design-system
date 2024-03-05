import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/types/quiz/flip_card_item_widget.dart';
import 'package:student_design_system/student_design_system.dart';

class TaskFlipCardTypeWidget extends StatefulWidget {
  const TaskFlipCardTypeWidget({
    Key? key,
    required this.content,
    required this.file,
    required this.expectedAnswer,
    required this.showLabel,
  }) : super(key: key);

  final String? content;
  final String? file;
  final String expectedAnswer;
  final bool showLabel;

  @override
  State<TaskFlipCardTypeWidget> createState() => _TaskFlipCardTypeWidgetState();
}

class _TaskFlipCardTypeWidgetState extends State<TaskFlipCardTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Stack(
            children: [
              FlipCard(
                fill: Fill.fillBack,
                direction: FlipDirection.HORIZONTAL,
                side: CardSide.FRONT,
                front: FlipCardItemWidget(
                  child: widget.file != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(widget.file!),
                        )
                      : BoxText.heading4(
                          widget.content!,
                          align: TextAlign.center,
                        ),
                ),
                back: FlipCardItemWidget(
                  child: BoxText.heading4(
                    widget.expectedAnswer,
                    align: TextAlign.center,
                  ),
                ),
              ),
              if (widget.showLabel)
                Positioned(
                  bottom: 70,
                  left: MediaQuery.of(context).size.width / 4,
                  child: BoxText.bodyLargeMedium(
                    'Toque no cartão para virar',
                    color: StudentDesignSystem.config.colors.dark[500],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
