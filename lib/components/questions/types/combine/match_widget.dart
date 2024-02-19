import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/models/match_model.dart';
import 'package:student_design_system/components/questions/shared/head_question_widget.dart';
import 'package:student_design_system/components/questions/types/combine/match_item_widget.dart';
import 'package:student_design_system/student_design_system.dart';
import '../../../../widgets/percent_indicator/questions_percent_indicator_widget.dart';

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
  final Function(int? contentId, int? matchId) onAnswer;

  @override
  State<MatchWidget> createState() => _MatchWidgetState();
}

class _MatchWidgetState extends State<MatchWidget> {
  int? contentSelected;
  int? matchSelected;

  void onSelected(bool isContent, int id) {
    setState(() {
      isContent ? contentSelected = id : matchSelected = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuestionsPercentIndicatorWidget(),
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
                    child: Column(
                      children: [
                        ...widget.match.map(
                          (e) => MatchItemWidget(
                            isContent: true,
                            isSelected: e.id == contentSelected,
                            onTap: () => onSelected(true, e.id),
                            match: e,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SpaceHorizontal.x4(),
                  Expanded(
                    child: Column(
                      children: [
                        ...widget.match.map(
                          (e) => MatchItemWidget(
                            isContent: false,
                            isSelected: e.id == matchSelected,
                            onTap: () => onSelected(false, e.id),
                            match: e,
                          ),
                        ),
                      ],
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
            onTap: contentSelected == null || matchSelected == null
                ? null
                : () => widget.onAnswer(
                      contentSelected,
                      matchSelected,
                    ),
          ),
        ),
      ],
    );
  }
}
