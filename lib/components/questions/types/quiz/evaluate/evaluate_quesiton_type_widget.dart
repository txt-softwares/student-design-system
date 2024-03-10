import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

import '../content_question_widget.dart';
import 'evaluate_option_widget.dart';

class EvaluateQuestionTypeWidget extends StatefulWidget {
  const EvaluateQuestionTypeWidget({
    Key? key,
    required this.options,
    required this.onAnswer,
    required this.correctItem,
  }) : super(key: key);

  final QuizQuestionModel correctItem;

  final List<QuizQuestionModel> options;
  final Function(int? optionId) onAnswer;

  @override
  State<EvaluateQuestionTypeWidget> createState() =>
      _EvaluateQuestionTypeWidgetState();
}

class _EvaluateQuestionTypeWidgetState
    extends State<EvaluateQuestionTypeWidget> {
  int? selected;

  void onSelected(int id) async {
    setState(() {
      selected = id;
    });

    await Future.delayed(const Duration(milliseconds: 400));

    widget.onAnswer(id);

    setState(() {
      selected = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              ContentQuestionWidget(
                file: widget.correctItem.file,
                text: widget.correctItem.content,
              ),
              const SpaceVertical.x6(),
              ...widget.options.map(
                (e) => EvaluateOptionWidget(
                  isSelected: e.id == selected,
                  onTap: () => onSelected(e.id),
                  option: e,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
