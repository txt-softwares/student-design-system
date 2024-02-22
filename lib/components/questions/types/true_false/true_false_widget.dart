import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/types/true_false/head_true_or_false_widget.dart';
import 'package:student_design_system/student_design_system.dart';
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

  final Function(bool answer) onAnswer;

  @override
  State<TrueFalseQuestionTypeWidget> createState() =>
      _TrueFalseQuestionTypeWidgetState();
}

class _TrueFalseQuestionTypeWidgetState
    extends State<TrueFalseQuestionTypeWidget> {
  bool? selected;

  void onSelected(bool answer) {
    setState(() {
      selected = answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    onTap: () => onSelected(true),
                    isSelected: selected == true,
                  ),
                  const SpaceHorizontal.x4(),
                  TrueOrFalseOptionWidget(
                    isTrue: false,
                    onTap: () => onSelected(false),
                    isSelected: selected == false,
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
            onTap: selected == null ? null : () => widget.onAnswer(selected!),
          ),
        ),
      ],
    );
  }
}
