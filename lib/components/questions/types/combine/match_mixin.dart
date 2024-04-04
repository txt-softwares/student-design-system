import 'package:flutter/material.dart';
import 'package:student_design_system/components/components.dart';

mixin MatchMixin<T extends MatchWidget> on State<T> {
  int? contentSelected;
  int? matchSelected;
  bool? isCorrect;
  int totalAnswers = 0;
  List<MatchModel> contentList = [];
  List<MatchModel> matchList = [];
  List<MatchModel> answers = [];

  void shuffleNumbers(List<MatchModel> match) {
    contentList = List.from(match);
    contentList.shuffle();
    matchList = List.from(match);
    matchList.shuffle();
  }

  void onSelected(bool isContent, MatchModel match) async {
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

          if (answers.length == widget.match.length) {
            widget.onAnswer(totalAnswers);
          }
        }

        contentSelected = null;
        matchSelected = null;
        isCorrect = null;
      });
    }
  }
}
