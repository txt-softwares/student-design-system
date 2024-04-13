import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/types/quiz/content_question_widget.dart';
import 'package:student_design_system/components/questions/types/quiz/learn/quiz_learn_modal_widget.dart';
import 'package:student_design_system/student_design_system.dart';

class QuizLearnQuestionTypeWidget extends StatefulWidget {
  const QuizLearnQuestionTypeWidget({
    super.key,
    required this.option,
    required this.onAnswer,
    required this.showButtons,
  });

  final QuizQuestionModel option;
  final Function(String? answer, int questionId) onAnswer;
  final bool showButtons;

  @override
  State<QuizLearnQuestionTypeWidget> createState() =>
      _QuizLearnQuestionTypeWidgetState();
}

class _QuizLearnQuestionTypeWidgetState
    extends State<QuizLearnQuestionTypeWidget> {
  final textConroller = TextEditingController();
  bool isAvaliable = false;

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        children: [
          const SpaceVertical.x10(),
          const SpaceVertical.x10(),
          const SpaceVertical.x10(),
          ContentQuestionWidget(
            file: widget.option.file,
            text: widget.option.content,
          ),
          const SpaceVertical.x6(),
          StudentInputWidget(
            focus: _focusNode,
            action: TextInputAction.done,
            autoFocus: true,
            onSubmitted: (p0) {
              _focusNode.unfocus();
              widget.onAnswer(
                textConroller.text,
                widget.option.id,
              );
              textConroller.clear();
              setState(() {
                isAvaliable = false;
              });
            },
            controller: textConroller,
            hintText: 'Digite o texto aqui',
            onChanged: (value) {
              if (!isAvaliable && value.isNotEmpty) {
                setState(() => isAvaliable = true);
              }
            },
          ),
          const SpaceVertical.x5(),
          if (widget.showButtons)
            Row(
              children: [
                Expanded(
                  child: StudentButtonWidget(
                    title: 'Verificar',
                    onTap: textConroller.text.isEmpty
                        ? null
                        : () {
                            _focusNode.unfocus();
                            widget.onAnswer(
                              textConroller.text,
                              widget.option.id,
                            );
                            textConroller.clear();
                            setState(() {
                              isAvaliable = false;
                            });
                          },
                  ),
                ),
                const SpaceHorizontal.x3(),
                StudentButtonWidget.secoundary(
                  width: 108,
                  title: 'Não sei',
                  onTap: () {
                    widget.onAnswer(null, widget.option.id);
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => QuizLearnModalWidget(
                        content: widget.option.expectedAnswer,
                      ),
                    );
                  },
                ),
              ],
            ),
          const SpaceVertical.x10(),
          const SpaceVertical.x10(),
        ],
      ),
    );
  }
}
