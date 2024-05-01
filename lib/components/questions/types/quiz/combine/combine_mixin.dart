import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/models/quiz_question_model.dart';

import 'combine_quesiton_widget.dart';

mixin MatchMixin<T extends CombineQuizQuestionWidget> on State<T> {
  QuizQuestionModel? firstSelected;
  QuizQuestionModel? secondSelected;
  bool? isCorrect;
  int totalAnswers = 0;
  List<QuizQuestionModel> contentList = [];
  List<QuizQuestionModel> answers = [];

  late DateTime startAt;

  void shuffleNumbers(List<QuizQuestionModel> items) {
    contentList = List<QuizQuestionModel>.from(items);
    final matchList = List<QuizQuestionModel>.from(
        items.map((e) => e.copyWith(answerInCombine: true)));
    contentList.addAll(matchList);
    contentList.shuffle();
  }

  void onSelected(QuizQuestionModel match) async {
    if (isCorrect != null) {
      return;
    }

    if (firstSelected != null &&
        (firstSelected?.id == match.id &&
            match.answerInCombine == firstSelected?.answerInCombine)) {
      return;
    }

    setState(() {
      if (firstSelected != null) {
        secondSelected = match;
      } else {
        firstSelected = match;
      }
    });

    if (firstSelected != null && secondSelected != null) {
      setState(() {
        isCorrect = secondSelected?.id == firstSelected?.id;
      });
      await Future.delayed(const Duration(milliseconds: 200));

      setState(() async {
        totalAnswers++;

        if (isCorrect!) {
          answers.add(match);
          if (answers.length >= widget.questions.length) {
            widget.onAnswer(totalAnswers, startAt.difference(DateTime.now()));
          }
        }

        firstSelected = null;
        secondSelected = null;
        isCorrect = null;
      });
    }
  }
}
