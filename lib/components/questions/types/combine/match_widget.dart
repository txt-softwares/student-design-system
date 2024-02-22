import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/models/match_model.dart';
import 'package:student_design_system/components/questions/shared/head_question_widget.dart';
import 'package:student_design_system/components/questions/types/combine/match_item_widget.dart';
import 'package:student_design_system/student_design_system.dart';
import '../../../../widgets/percent_indicator/questions_percent_indicator_widget.dart';
import 'match_mixin.dart';

class MatchWidget extends StatefulWidget {
  const MatchWidget({
    Key? key,
    required this.match,
    required this.file,
    required this.title,
    required this.onAnswer,
  }) : super(key: key);

  final String? title;
  final String? file;
  final List<MatchModel> match;
  final Function(int totalAnswers) onAnswer;

  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> with MatchMixin {
  @override
  void initState() {
    super.initState();
    shuffleNumbers(widget.match);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuestionsPercentIndicatorWidget(
          finishedQuestions: 1,
          totalQuestions: 10,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              HeadQuestionWidget(
                file: widget.file,
                title: widget.title,
              ),
              if (widget.file == null) const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => MatchItemWidget(
                        isAnswered: answers.any(
                          (element) => element.id == contentList[index].id,
                        ),
                        selectdItem: contentSelected,
                        isCorrect: isCorrect,
                        isContent: true,
                        isSelected: contentList[index].id == contentSelected,
                        onTap: () => onSelected(true, contentList[index]),
                        match: contentList[index],
                      ),
                      separatorBuilder: (context, index) =>
                          const SpaceVertical.x6(),
                      itemCount: contentList.length,
                    ),
                  ),
                  const SpaceHorizontal.x4(),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => MatchItemWidget(
                        isAnswered: answers.any(
                          (element) => element.id == matchList[index].id,
                        ),
                        selectdItem: matchSelected,
                        isCorrect: isCorrect,
                        isContent: false,
                        isSelected: matchList[index].id == matchSelected,
                        onTap: () => onSelected(false, matchList[index]),
                        match: matchList[index],
                      ),
                      separatorBuilder: (context, index) =>
                          const SpaceVertical.x6(),
                      itemCount: matchList.length,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: StudentDesignSystem.config.colors.darkblue[200],
          height: 1,
        ),
        Container(
          padding: const EdgeInsets.all(24),
          child: StudentButtonWidget(
            title: 'Continuar',
            onTap: answers.length < widget.match.length
                ? null
                : () => widget.onAnswer(totalAnswers),
          ),
        ),
      ],
    );
  }
}
