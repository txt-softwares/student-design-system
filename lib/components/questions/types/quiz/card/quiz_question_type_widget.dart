import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/models/quiz_question_model.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'task_flip_card_type_widget.dart';

class FlipCardQuestionTypeWidget extends StatefulWidget {
  const FlipCardQuestionTypeWidget({
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
  State<FlipCardQuestionTypeWidget> createState() =>
      _FlipCardQuestionTypeWidgetState();
}

class _FlipCardQuestionTypeWidgetState
    extends State<FlipCardQuestionTypeWidget> {
  List<SwipeItem> _swipeItems = [];
  MatchEngine? _matchEngine;
  int currentIndex = -1;

  final List<QuizQuestionModel> wrongOptions = [];

  @override
  void initState() {
    super.initState();
    _swipeItems = widget.options
        .map((e) => SwipeItem(
              content: e.id,
              likeAction: () {
                widget.onAnswer(true, e.id);
              },
              nopeAction: () {
                widget.onAnswer(false, e.id);
                addNewCards();
              },
            ))
        .toList();
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return SwipeCards(
      matchEngine: _matchEngine!,
      itemBuilder: (BuildContext context, int index) {
        final allOptions = [...widget.options, ...wrongOptions];
        return TaskFlipCardTypeWidget(
          item: allOptions[index],
          showLabel: widget.showLabel,
        );
      },
      onStackFinished: () async {
        await Future.delayed(const Duration(microseconds: 100));
        widget.onFinished();
      },
      leftSwipeAllowed: true,
      rightSwipeAllowed: true,
      upSwipeAllowed: false,
      fillSpace: true,
    );
  }

  void addNewCards() {
    _swipeItems.add(SwipeItem(
      content: _matchEngine?.currentItem?.content,
      likeAction: () {
        widget.onAnswer(true, _matchEngine?.currentItem?.content);
      },
      nopeAction: () {
        widget.onAnswer(false, _matchEngine?.currentItem?.content);
        addNewCards();
      },
    ));
    setState(() {
      wrongOptions.add(widget.options.firstWhere(
          (element) => element.id == _matchEngine?.currentItem?.content));
    });
  }
}
