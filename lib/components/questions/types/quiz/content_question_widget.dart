import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:student_design_system/student_design_system.dart';

import '../../../../utils/text_to_speech.dart';

class ContentQuestionWidget extends StatefulWidget {
  const ContentQuestionWidget({
    super.key,
    required this.file,
    required this.answer,
    required this.text,
  });
  final String? file;
  final String? text;
  final String answer;

  @override
  State<ContentQuestionWidget> createState() => _ContentQuestionWidgetState();
}

class _ContentQuestionWidgetState extends State<ContentQuestionWidget> {
  final tts = StudentTTS();

  @override
  void initState() {
    super.initState();
    tts.init();
  }

  @override
  void dispose() {
    super.dispose();
    tts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 196,
      padding: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: StudentDesignSystem.config.colors.dark[200]!),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: widget.file != null
                ? StudentPictureWidget.network(widget.file!)
                : QuizTextAnswerWidget(text: widget.text),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                tts.speak(widget.answer);
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 24),
                child: Icon(IconlyBold.volumeUp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizTextAnswerWidget extends StatelessWidget {
  const QuizTextAnswerWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 48,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: text != null
            ? StudentDesignSystem.config.colors.primaryPurple
            : null,
      ),
      child: HtmlWidget(
        '<center>${text ?? ''}</center>',
        textStyle: TextStyle(
          color: StudentDesignSystem.config.colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
