import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/types/quiz/combine/combine_item_widget.dart';
import '../../../models/quiz_question_model.dart';
import 'combine_mixin.dart';

class CombineQuizQuestionWidget extends StatefulWidget {
  const CombineQuizQuestionWidget({
    Key? key,
    required this.questions,
    required this.onAnswer,
    required this.onCombine,
  }) : super(key: key);

  final List<QuizQuestionModel> questions;
  final Function(int totalAnswers, Duration duration) onAnswer;
  final Function() onCombine;

  @override
  State<CombineQuizQuestionWidget> createState() =>
      _CombineQuizQuestionWidgetState();
}

class _CombineQuizQuestionWidgetState extends State<CombineQuizQuestionWidget>
    with MatchMixin {
  @override
  void initState() {
    super.initState();
    shuffleNumbers(widget.questions);
    startAt = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.68,
        crossAxisSpacing: 10.0,
      ),
      padding: const EdgeInsets.only(bottom: 24),
      itemCount: contentList.length,
      itemBuilder: (context, index) {
        return CombineItemWidget(
          match: contentList[index],
          onTap: () => onSelected(contentList[index]),
          isSelected: (firstSelected?.id == contentList[index].id &&
                  contentList[index].answerInCombine ==
                      firstSelected?.answerInCombine) ||
              (secondSelected?.id == contentList[index].id &&
                  contentList[index].answerInCombine ==
                      secondSelected?.answerInCombine),
          isCorrect: isCorrect,
          isAnswered: answers.any(
            (element) => element.id == contentList[index].id,
          ),
        );
      },
    );
  }
}
