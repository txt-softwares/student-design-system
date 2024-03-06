import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/models/quiz_question_model.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'task_flip_card_type_widget.dart';

class QuizQuestionTypeWidget extends StatefulWidget {
  const QuizQuestionTypeWidget({
    Key? key,
    required this.showLabel,
    required this.onAnswer,
    required this.options,
    required this.onFinished,
  }) : super(key: key);

  final bool showLabel;
  final Function(bool isCorrect, int id) onAnswer;
  final List<QuizQuestionModel> options;
  final Function() onFinished;

  @override
  State<QuizQuestionTypeWidget> createState() => _QuizQuestionTypeWidgetState();
}

class _QuizQuestionTypeWidgetState extends State<QuizQuestionTypeWidget> {
  List<SwipeItem> _swipeItems = [];
  MatchEngine? _matchEngine;
  int currentIndex = -1;

  @override
  void initState() {
    _swipeItems = widget.options.map((e) => SwipeItem(content: e.id)).toList();
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwipeCards(
      matchEngine: _matchEngine!,
      itemBuilder: (BuildContext context, int index) {
        return TaskFlipCardTypeWidget(
          content: widget.options[index].content,
          file: widget.options[index].file,
          expectedAnswer: widget.options[index].expectedAnswer,
          showLabel: widget.showLabel,
        );
      },
      onStackFinished: widget.onFinished,
      itemChanged: (p0, p1) {
        widget.onAnswer(p0.decision == Decision.like, p0.content);
      },
      leftSwipeAllowed: true,
      rightSwipeAllowed: true,
      upSwipeAllowed: false,
      fillSpace: true,
    );
  }
}
