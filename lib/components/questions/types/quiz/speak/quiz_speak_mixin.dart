import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:student_design_system/student_design_system.dart';

import 'quiz_speak_question_type_widget.dart';

class WordRecognized extends StateNotifier<String> {
  WordRecognized(super.state);

  set value(String text) => state = text;
}

class ListenSpeech extends StateNotifier<bool> {
  ListenSpeech(super.state);

  set value(bool val) => state = val;
}

final wordProvider =
    StateNotifierProvider.autoDispose<WordRecognized, String>((ref) {
  return WordRecognized('');
});

final listenProvider =
    StateNotifierProvider.autoDispose<ListenSpeech, bool>((ref) {
  return ListenSpeech(false);
});

mixin QuizSpeakMixin<T extends QuizSpeakQuestionTypeWidget>
    on ConsumerState<T> {
  final SpeechToText speech = SpeechToText();

  final String currentLocaleId = 'en_US';

  Future<bool> askPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
    ].request();

    return statuses.entries
        .every((element) => element.value == PermissionStatus.granted);
  }

  @override
  void dispose() {
    super.dispose();
    print('DISPOSE PAGE ${widget.item.id}');
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
      widget.onCantSpeakNow();
    }
  }

  void _onError(SpeechRecognitionError errorNotification) async {
    print('ERROR: ${errorNotification.errorMsg}');

    if (errorNotification.errorMsg == 'error_no_match') {
      await speech.stop();
      await speech.cancel();
      startListening();
      return;
    }

    stopListening();
    if (mounted) {
      StudentSnackBar.show(
        context: context,
        text:
            'Erro ao tentar te ouvir, tente esse formato novamente mais tarde',
        bgColor: StudentDesignSystem.config.colors.error[50]!,
        mainColor: StudentDesignSystem.config.colors.error[500]!,
      );
      widget.onCantSpeakNow();
    }
  }

  /// Each time to start a speech recognition session
  void startListening() async {
    print("START LISTEN FOR ${widget.item.id}");
    ref.read(wordProvider.notifier).value = '';

    final options = SpeechListenOptions(
      onDevice: false,
      listenMode: ListenMode.dictation,
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
    ref.read(listenProvider.notifier).value = true;
  }

  void stopListening() async {
    await speech.stop();
    await speech.cancel();

    widget.onAnswer(ref.read(wordProvider));
  }

  void resultListener(SpeechRecognitionResult result) {
    //TODO: get the word near of the result
    ref.read(wordProvider.notifier).value = result.recognizedWords;

    if (result.finalResult) {
      ref.read(listenProvider.notifier).value = false;
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
