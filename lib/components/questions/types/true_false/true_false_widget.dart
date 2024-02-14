import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/shared/head_question_widget.dart';
import 'package:student_design_system/student_design_system.dart';

import '../multiple_choice/item_option_widget.dart';

class TrueFalseQuestionTypeWidget extends StatefulWidget {
  const TrueFalseQuestionTypeWidget({
    Key? key,
    required this.file,
    required this.title,
    required this.onAnswer,
  }) : super(key: key);

  final String? title;
  final String? file;

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
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              HeadQuestionWidget(
                file: widget.file,
                title: widget.title,
              ),
              ...[
                StudentTaskOptionModel(
                  content: 'Verdadeiro',
                  correct: true,
                  id: 1,
                ),
                StudentTaskOptionModel(
                  content: 'Falso',
                  correct: false,
                  id: 1,
                ),
              ].map((e) => TaskOptionWidget(
                    isSelected: selected == e.id,
                    onTap: () => onSelected(e.id),
                    option: e,
                  )),
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
        )
      ],
    );
  }
}
