import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

import '../content_question_widget.dart';
import 'flip_card_item_widget.dart';

class TaskFlipCardTypeWidget extends StatefulWidget {
  const TaskFlipCardTypeWidget({
    Key? key,
    required this.item,
    required this.showLabel,
  }) : super(key: key);

  final QuizQuestionModel item;

  final bool showLabel;

  @override
  State<TaskFlipCardTypeWidget> createState() => _TaskFlipCardTypeWidgetState();
}

class _TaskFlipCardTypeWidgetState extends State<TaskFlipCardTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      side: CardSide.FRONT,
      front: FlipCardItemWidget(
        isBack: false,
        showLabel: widget.showLabel,
        answer: widget.item.expectedAnswer,
        child: widget.item.file != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: StudentPictureWidget.network(widget.item.file!),
              )
            : QuizTextAnswerWidget(
                text: widget.item.content!,
              ),
      ),
      back: FlipCardItemWidget(
        isBack: true,
        showLabel: false,
        answer: widget.item.expectedAnswer,
        child: BoxText.heading4(
          widget.item.expectedAnswer,
          align: TextAlign.center,
        ),
      ),
    );
  }
}
