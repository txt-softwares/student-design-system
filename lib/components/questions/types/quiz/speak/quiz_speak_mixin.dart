import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:student_design_system/components/questions/types/quiz/speak/quiz_speak_widget.dart';
import 'package:student_design_system/student_design_system.dart';

mixin QuizSpeakMixin<T extends QuizSpeakWidget> on State<T> {
  final SpeechToText speech = SpeechToText();
  String lastWords = '';

  final String currentLocaleId = 'en_US';

  Future<bool> askPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
    ].request();

    return statuses.entries
        .every((element) => element.value == PermissionStatus.granted);
  }

  void initSpeech() async {
    try {
      final permission = await askPermission();

      if (!permission) {
        widget.onCantSpeakNow();
        return;
      }

      var hasSpeech = await speech.initialize(
        onError: _onError,
      );
      if (!hasSpeech) {
        widget.onCantSpeakNow();
      }
      if (!mounted) return;
    } catch (e) {
      _onError;
      widget.onCantSpeakNow();
    }
  }

  void _onError(SpeechRecognitionError errorNotification) {
    StudentSnackBar.show(
      context: context,
      text: 'Erro ao tentar te ouvir, tente esse formato novamente mais tarde',
      bgColor: StudentDesignSystem.config.colors.error[50]!,
      mainColor: StudentDesignSystem.config.colors.error[500]!,
    );
    widget.onCantSpeakNow();
  }

  /// Each time to start a speech recognition session
  void startListening() async {
    setState(() {
      lastWords = '';
    });

    final options = SpeechListenOptions(
      onDevice: false,
      listenMode: ListenMode.confirmation,
      cancelOnError: true,
      partialResults: true,
      autoPunctuation: true,
      enableHapticFeedback: true,
    );

    speech.listen(
      onResult: resultListener,
      localeId: currentLocaleId,
      listenOptions: options,
    );
  }

  void stopListening() async {
    await speech.stop();
    speech.cancel();
    widget.onAnswer(lastWords);
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });

    if (result.finalResult) {
      stopListening();
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
}
