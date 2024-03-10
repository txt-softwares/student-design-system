import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/models/quiz_question_model.dart';

mixin MatchMixin<T extends StatefulWidget> on State<T> {
  int? contentSelected;
  int? matchSelected;
  bool? isCorrect;
  int totalAnswers = 0;
  List<QuizQuestionModel> contentList = [];
  List<QuizQuestionModel> answers = [];

  void shuffleNumbers(List<QuizQuestionModel> items) {
    contentList = List<QuizQuestionModel>.from(items);
    final matchList = List<QuizQuestionModel>.from(
        items.map((e) => e.copyWith(answerInCombine: true)));
    contentList.addAll(matchList);
    contentList.shuffle();
  }

  void onSelected(bool isContent, QuizQuestionModel match) async {
    if (isCorrect != null) {
      return;
    }
    setState(() {
      if (isContent) {
        contentSelected = match.id;
      } else {
        matchSelected = match.id;
      }
    });

    if (contentSelected != null && matchSelected != null) {
      setState(() {
        isCorrect = contentSelected == matchSelected;
      });
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        totalAnswers++;

        if (isCorrect!) {
          answers.add(match);
        }

        contentSelected = null;
        matchSelected = null;
        isCorrect = null;
      });
    }
  }
}
