import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_design_system/student_design_system.dart';
import 'package:student_design_system/utils/speech_to_text.dart';

import 'quiz_speak_question_type_widget.dart';

class WordRecognized extends StateNotifier<String> {
  WordRecognized(super.state);

  set value(String text) => state = text;
}

class ListenSpeech extends StateNotifier<bool> {
  ListenSpeech(super.state);

  set value(bool val) => state = val;
}

final wordProvider = StateNotifierProvider.autoDispose
    .family<WordRecognized, String, int>((ref, id) {
  return WordRecognized('');
});

final listenProvider = StateNotifierProvider.autoDispose
    .family<ListenSpeech, bool, int>((ref, id) {
  return ListenSpeech(false);
});

mixin QuizSpeakMixin<T extends QuizSpeakQuestionTypeWidget>
    on ConsumerState<T> {
  void initSpeech() async {
    ref.read(sttProvider(widget.item.id)).init(
          mounted: mounted,
          onCantSpeak: widget.onCantSpeakNow,
          onStopedError: _onError,
          onAnswer: (p0) {
            ref.read(wordProvider(widget.item.id).notifier).value = p0;
          },
          onStart: () {
            ref.read(listenProvider(widget.item.id).notifier).value = true;
          },
          onFinishAnswer: () {
            ref.read(listenProvider(widget.item.id).notifier).value = false;
            widget.onAnswer(ref.read(wordProvider(widget.item.id)));
          },
        );
  }

  void _onError() async {
    StudentSnackBar.show(
      context: context,
      text: 'Erro ao tentar te ouvir, tente novamente mais tarde',
      bgColor: StudentDesignSystem.config.colors.error[50]!,
      mainColor: StudentDesignSystem.config.colors.error[500]!,
    );
    widget.onCantSpeakNow();
  }

  /// Each time to start a speech recognition session
  void startListening() async {
    ref.read(sttProvider(widget.item.id)).startListening(
      onAnswer: (p0) {
        ref.read(wordProvider(widget.item.id).notifier).value = p0;
      },
      onStart: () {
        ref.read(listenProvider(widget.item.id).notifier).value = true;
      },
      onFinishAnswer: () {
        ref.read(listenProvider(widget.item.id).notifier).value = false;
        widget.onAnswer(ref.read(wordProvider(widget.item.id)));
      },
    );
  }

  void stopListening() async {
    ref.read(sttProvider(widget.item.id)).stop(onFinishAnswer: () {
      ref.read(listenProvider(widget.item.id).notifier).value = false;
      widget.onAnswer(ref.read(wordProvider(widget.item.id)));
    });
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
