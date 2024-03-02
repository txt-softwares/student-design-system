import 'package:flutter/material.dart';

import 'sequence_widget.dart';
import 'discursive_widget.dart';

class WritterQuestionTypeWidget extends StatelessWidget {
  const WritterQuestionTypeWidget({
    Key? key,
    required this.expectedAnswer,
    required this.onAnswer,
    required this.onCantSpeakNow,
    required this.canSpeak,
  }) : super(key: key);

  final String expectedAnswer;
  final Function(String answer) onAnswer;
  final bool canSpeak;
  final Function() onCantSpeakNow;

  @override
  Widget build(BuildContext context) {
    if (canSpeak) {
      return DiscursiveTypeWidget(
        title: expectedAnswer,
        onAnswer: onAnswer,
        onCantSpeakNow: onCantSpeakNow,
      );
    } else {
      return OrderSentenceTypeWidget(
        content: expectedAnswer,
        onAnswer: onAnswer,
      );
    }
  }
}
