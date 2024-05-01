import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:student_design_system/student_design_system.dart';

import '../../../../../utils/text_to_speech.dart';

class LearnErrorQuestionWidget extends StatefulWidget {
  const LearnErrorQuestionWidget({
    super.key,
    required this.item,
  });

  final QuizQuestionModel item;

  @override
  State<LearnErrorQuestionWidget> createState() =>
      _LearnErrorQuestionWidgetState();
}

class _LearnErrorQuestionWidgetState extends State<LearnErrorQuestionWidget> {
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
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: StudentDesignSystem.config.colors.error[50]!,
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: widget.item.file != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(imageUrl: widget.item.file!),
                  )
                : HtmlWidget(
                    '<center>${widget.item.content}</center>',
                    textStyle: TextStyles.bodyXLargeSemiBold.copyWith(
                      color: StudentDesignSystem.config.colors.error,
                    ),
                  ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                tts.speak(widget.item.expectedAnswer);
              },
              child: const Icon(IconlyBold.volumeUp),
            ),
          ),
        ],
      ),
    );
  }
}
