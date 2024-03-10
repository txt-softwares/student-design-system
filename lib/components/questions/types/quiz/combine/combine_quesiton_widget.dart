import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/types/quiz/combine/combine_item_widget.dart';
import '../../../models/quiz_question_model.dart';
import 'combine_mixin.dart';

class CombineQuestionWidget extends StatefulWidget {
  const CombineQuestionWidget({
    Key? key,
    required this.questions,
    required this.onAnswer,
  }) : super(key: key);

  final List<QuizQuestionModel> questions;
  final Function(int totalAnswers, Duration duration) onAnswer;

  @override
  State<CombineQuestionWidget> createState() => _CombineQuestionWidgetState();
}

class _CombineQuestionWidgetState extends State<CombineQuestionWidget>
    with MatchMixin {
  @override
  void initState() {
    super.initState();
    shuffleNumbers(widget.questions);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
                padding: const EdgeInsets.all(8.0), // padding around the grid
                itemCount: contentList.length, // total number of items
                itemBuilder: (context, index) {
                  return CombineItemWidget(
                    match: contentList[index],
                    onTap: () => onSelected(false, contentList[index]),
                    isSelected: contentList[index].id == matchSelected,
                    isCorrect: isCorrect,
                    selectdItem: matchSelected,
                    isAnswered: answers.any(
                      (element) => element.id == contentList[index].id,
                    ),
                  );
                },
              )
            ])),
      ],
    );
  }
}
