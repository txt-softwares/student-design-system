import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:student_design_system/student_design_system.dart';

import '../../shared/head_question_widget.dart';

class DiscursiveTypeWidget extends StatefulWidget {
  const DiscursiveTypeWidget({
    Key? key,
    required this.title,
    required this.file,
    required this.onAnswer,
  }) : super(key: key);

  final String? title;
  final String? file;
  final Function(String answer) onAnswer;

  @override
  State<DiscursiveTypeWidget> createState() => _DiscursiveTypeWidgetState();
}

class _DiscursiveTypeWidgetState extends State<DiscursiveTypeWidget> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
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
            ],
          ),
        ),
        if (_lastWords.isNotEmpty) BoxText.body(_lastWords),
        FloatingActionButton(
          onPressed:
              // If not yet listening for speech start, otherwise stop
              _speechToText.isNotListening ? _startListening : _stopListening,
          tooltip: 'Listen',
          child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
        ),
        Divider(
          color: StudentDesignSystem.config.colors.darkblue[200],
          height: 1,
        ),
        Container(
          padding: const EdgeInsets.all(24),
          child: StudentButtonWidget(
            title: 'Verificar',
            onTap: () => widget.onAnswer(''),
          ),
        )
      ],
    );
  }
}
