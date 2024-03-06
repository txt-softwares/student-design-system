import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../../models/option_model.dart';
import 'task_flip_card_type_widget.dart';

class QuizQuestionTypeWidget extends StatefulWidget {
  const QuizQuestionTypeWidget({
    Key? key,
    required this.id,
    required this.content,
    required this.file,
    required this.expectedAnswer,
    required this.showLabel,
    required this.onStackFinished,
    required this.onAnswer,
    required this.options,
    required this.leftSwipeAllowed,
  }) : super(key: key);

  final int id;
  final String? content;
  final String? file;
  final String expectedAnswer;
  final bool showLabel;
  final Function() onStackFinished;
  final Function(bool isCorrect, int id) onAnswer;
  final List<StudentTaskOptionModel> options;
  final bool leftSwipeAllowed;

  @override
  State<QuizQuestionTypeWidget> createState() => _QuizQuestionTypeWidgetState();
}

class _QuizQuestionTypeWidgetState extends State<QuizQuestionTypeWidget> {
  final List<SwipeItem> _swipeItems = [];
  MatchEngine? _matchEngine;
  int currentIndex = -1;

  @override
  void initState() {
    for (int i = 0; i < widget.options.length; i++) {
      _swipeItems.add(
        SwipeItem(),
      );
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwipeCards(
      matchEngine: _matchEngine!,
      itemBuilder: (BuildContext context, int index) {
        return TaskFlipCardTypeWidget(
          content: widget.content,
          file: widget.file,
          expectedAnswer: widget.expectedAnswer,
          showLabel: widget.showLabel,
        );
      },
      itemChanged: (p0, p1) {
        widget.onAnswer(p0.decision == Decision.like, widget.id);
      },
      onStackFinished: widget.onStackFinished,
      leftSwipeAllowed: widget.leftSwipeAllowed,
      rightSwipeAllowed: true,
      upSwipeAllowed: false,
      fillSpace: true,
    );
  }
}
