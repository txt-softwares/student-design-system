import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/types/true_false/head_true_or_false_widget.dart';
import 'package:student_design_system/student_design_system.dart';
import '../../../../widgets/percent_indicator/questions_percent_indicator_widget.dart';
import 'true_or_false_option_widget.dart';

class TrueFalseQuestionTypeWidget extends StatefulWidget {
  const TrueFalseQuestionTypeWidget({
    Key? key,
    required this.file,
    required this.title,
    required this.onAnswer,
    required this.image,
  }) : super(key: key);

  final String? title;
  final String? file;
  final String image;

  final Function(int? id) onAnswer;

  @override
  State<TrueFalseQuestionTypeWidget> createState() =>
      _TrueFalseQuestionTypeWidgetState();
}

class _TrueFalseQuestionTypeWidgetState
    extends State<TrueFalseQuestionTypeWidget> {
  int? selected;

  void onSelected(int id) {
    setState(() {
      selected = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuestionsPercentIndicatorWidget(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(
              top: 108,
              right: 24,
              left: 24,
            ),
            children: [
              HeadTrueOrFalseWidget(
                title: widget.title!,
                image: widget.image,
              ),
              Row(
                children: [
                  TrueOrFalseOptionWidget(
                    isTrue: true,
                    onTap: () {},
                  ),
                  const SpaceHorizontal.x4(),
                  TrueOrFalseOptionWidget(
                    isTrue: false,
                    onTap: () {},
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
            title: 'Verificar',
            onTap: selected == null ? null : () => widget.onAnswer(selected),
          ),
        ),
      ],
    );
  }
}
