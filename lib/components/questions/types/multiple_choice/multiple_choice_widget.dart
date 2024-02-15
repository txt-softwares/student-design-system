import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/shared/head_question_widget.dart';
import 'package:student_design_system/student_design_system.dart';

import 'item_option_widget.dart';

class MultipleChoiceQuestionWidget extends StatefulWidget {
  const MultipleChoiceQuestionWidget({
    Key? key,
    required this.options,
    required this.file,
    required this.title,
    required this.onAnswer,
  }) : super(key: key);

  final String? title;
  final String? file;

  final List<StudentTaskOptionModel> options;
  final Function(int? id) onAnswer;

  @override
  State<MultipleChoiceQuestionWidget> createState() =>
      _MultipleChoiceQuestionWidgetState();
}

class _MultipleChoiceQuestionWidgetState
    extends State<MultipleChoiceQuestionWidget> {
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
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              HeadQuestionWidget(
                file: widget.file,
                title: widget.title,
              ),
              ...widget.options.map(
                (e) => TaskOptionWidget(
                  isSelected: e.id == selected,
                  onTap: () => onSelected(e.id),
                  option: e,
                ),
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
