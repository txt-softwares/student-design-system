import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:student_design_system/student_design_system.dart';

import '../../shared/head_question_widget.dart';

class DiscursiveTypeWidget extends StatefulWidget {
  const DiscursiveTypeWidget({
    Key? key,
    required this.expectedAnswer,
    required this.onAnswer,
    required this.onCantSpeakNow,
    required this.content,
    this.file,
  }) : super(key: key);

  final String expectedAnswer;
  final String content;
  final String? file;

  final Function(String answer) onAnswer;
  final Function() onCantSpeakNow;

  @override
  State<DiscursiveTypeWidget> createState() => _DiscursiveTypeWidgetState();
}

class _DiscursiveTypeWidgetState extends State<DiscursiveTypeWidget> {
  final SpeechToText _speechToText = SpeechToText();
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    var locales = await _speechToText.locales();
    final usa = locales.firstWhere((element) => element.localeId == 'en_US');
    await _speechToText.listen(
        onResult: _onSpeechResult, localeId: usa.localeId);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    widget.onAnswer(_lastWords);
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });

    if (result.finalResult) {
      widget.onAnswer(_lastWords);
    }
  }

  String removeSpecialCharacters(String input) {
    RegExp regex = RegExp(r"[^a-zA-Z0-9]");
    return input.toLowerCase().replaceAll(regex, "");
  }

  TextSpan highlightWords(String baseString, String compareString) {
    List<String> baseWords = baseString.split(' ');
    List<String> compareWords = compareString.split(' ');

    List<TextSpan> spans = [];

    int maxLength = baseWords.length > compareWords.length
        ? baseWords.length
        : compareWords.length;

    for (int i = 0; i < maxLength; i++) {
      String baseWord = i < baseWords.length ? baseWords[i] : "";
      String compareWord = i < compareWords.length ? compareWords[i] : "";

      if (removeSpecialCharacters(baseWord) ==
          removeSpecialCharacters(compareWord)) {
        spans.add(
          TextSpan(
            text: '$baseWord ',
            style: TextStyles.bodyXLargeSemiBold.copyWith(
              color: StudentDesignSystem.config.colors.secondaryGreen,
            ),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: '$baseWord ',
            style: TextStyles.bodyXLargeSemiBold.copyWith(
                color: compareWord.isEmpty
                    ? StudentDesignSystem.config.colors.black
                    : StudentDesignSystem.config.colors.error),
          ),
        );
      }
    }

    return TextSpan(children: spans);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: HeadQuestionWidget(
            file: widget.file,
            title: widget.content,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Center(
                  child: SizedBox(
                    height: 56,
                    width: 56,
                    child: SvgPicture.asset(
                      'assets/images/audio-primary.svg',
                      package: 'student_design_system',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.all(24)
                      .copyWith(left: 12, top: 0, bottom: 0),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      StudentDesignSystem.config.borderRadius,
                    ),
                    border: Border.all(
                      color: StudentDesignSystem.config.colors.dark[200]!,
                    ),
                  ),
                  child: RichText(
                    text: highlightWords(widget.expectedAnswer, _lastWords),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap:
                _speechToText.isNotListening ? _startListening : _stopListening,
            child: Container(
              width: double.maxFinite,
              margin: const EdgeInsets.all(24).copyWith(top: 0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  StudentDesignSystem.config.borderRadius,
                ),
                border: Border.all(
                  color: StudentDesignSystem.config.colors.dark[200]!,
                ),
              ),
              child: !_speechToText.isNotListening
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Lottie.asset(
                            'assets/audio/audio-wave.json',
                            package: 'student_design_system',
                            fit: BoxFit.fitWidth,
                            repeat: true,
                            width: double.maxFinite,
                            alignment: Alignment.center,
                            height: 80,
                          ),
                        ),
                        const SpaceVertical.x4(),
                        BoxText.bodyLargeSemiBold(
                          'Te ouvindo...',
                          color: StudentDesignSystem.config.colors.dark[500],
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: SvgPicture.asset(
                              'assets/images/mic-primary.svg',
                              package: 'student_design_system',
                            ),
                          ),
                        ),
                        const SpaceVertical.x4(),
                        BoxText.bodyLargeSemiBold(
                          'Toque para falar',
                          color: StudentDesignSystem.config.colors.dark[500],
                        ),
                      ],
                    ),
            ),
          ),
        ),
        Divider(
          color: StudentDesignSystem.config.colors.darkblue[200],
          height: 1,
        ),
        Container(
          padding: const EdgeInsets.all(24),
          child: StudentButtonWidget.secoundary(
            title: 'Não posso falar agora',
            onTap: widget.onCantSpeakNow,
          ),
        )
      ],
    );
  }
}
