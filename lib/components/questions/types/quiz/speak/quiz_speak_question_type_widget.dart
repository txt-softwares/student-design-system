import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/types/quiz/speak/quiz_speak_widget.dart';

class QuizSpeakQuestionTypeWidget extends StatelessWidget {
  const QuizSpeakQuestionTypeWidget({
    Key? key,
    required this.expectedAnswer,
    required this.onAnswer,
    required this.onCantSpeakNow,
    required this.canSpeak,
    required this.content,
    required this.file,
  }) : super(key: key);

  final String expectedAnswer;
  final String content;
  final String? file;
  final Function(String answer) onAnswer;
  final bool canSpeak;
  final Function() onCantSpeakNow;

  @override
  Widget build(BuildContext context) {
    return QuizSpeakWidget(
      content: content,
      file: file,
      expectedAnswer: expectedAnswer,
      onAnswer: onAnswer,
      onCantSpeakNow: onCantSpeakNow,
    );
  }
}
