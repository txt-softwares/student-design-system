import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_design_system/student_design_system.dart';
import 'package:student_design_system/utils/text_to_speech.dart';

class FlipCardItemWidget extends StatefulWidget {
  const FlipCardItemWidget({
    super.key,
    required this.child,
    required this.showLabel,
    this.answer,
  });
  final Widget child;
  final bool showLabel;
  final String? answer;

  @override
  State<FlipCardItemWidget> createState() => _FlipCardItemWidgetState();
}

class _FlipCardItemWidgetState extends State<FlipCardItemWidget> {
  final tts = StudentTTS();

  @override
  void initState() {
    super.initState();
    tts.init();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 32,
            bottom: 32,
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: StudentDesignSystem.config.colors.dark[200]!,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: StudentDesignSystem.config.colors.dark[100]!,
              ),
            ],
            color: StudentDesignSystem.config.colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: widget.child,
            ),
          ),
        ),
        if (widget.answer != null)
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                tts.speak(widget.answer!);
              },
              child: const Padding(
                padding: EdgeInsets.all(24.0),
                child: Icon(IconlyBold.volumeUp),
              ),
            ),
          ),
        if (widget.showLabel)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: BoxText.bodyLargeMedium(
                'Toque no cartão para virar',
                color: StudentDesignSystem.config.colors.dark[500],
              ),
            ),
          ),
      ],
    );
  }
}
