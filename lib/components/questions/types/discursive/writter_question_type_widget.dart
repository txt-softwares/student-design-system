import 'package:flutter/material.dart';
import 'package:student_design_system/components/questions/types/discursive/complete_question_widget.dart';

import 'sequence_widget.dart';
import 'discursive_widget.dart';

class WritterQuestionTypeWidget extends StatelessWidget {
  const WritterQuestionTypeWidget({
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
    if (expectedAnswer.contains('{') && expectedAnswer.contains('}')) {
      return CompleteTheSentenceypeWidget(
        title: content,
        expectedAnswer: expectedAnswer,
        onAnswer: onAnswer,
        file: file,
      );
    }
    if (canSpeak) {
      return DiscursiveTypeWidget(
        content: content,
        file: file,
        expectedAnswer: expectedAnswer,
        onAnswer: onAnswer,
        onCantSpeakNow: onCantSpeakNow,
      );
    } else {
      return OrderSentenceTypeWidget(
        content: content,
        file: file,
        onAnswer: onAnswer,
        expectedAnswer: expectedAnswer,
      );
    }
  }
}
