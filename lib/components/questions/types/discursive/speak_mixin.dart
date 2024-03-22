import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../../student_design_system.dart';
import 'discursive_widget.dart';

mixin SpeakMixin<T extends SpeakTypeWidget> on State<T> {
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
        StudentSnackBar.show(
          // ignore: use_build_context_synchronously
          context: context,
          text:
              'Você não habilitou as permissões necessárias para utilizar essa função',
          bgColor: StudentDesignSystem.config.colors.error[50]!,
          mainColor: StudentDesignSystem.config.colors.error[500]!,
        );
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
      StudentSnackBar.show(
        context: context,
        text:
            'Erro ao tentar te ouvir, tente esse formato novamente mais tarde',
        bgColor: StudentDesignSystem.config.colors.error[50]!,
        mainColor: StudentDesignSystem.config.colors.error[500]!,
      );
    }
  }

  void _onError(SpeechRecognitionError errorNotification) {
    StudentSnackBar.show(
      context: context,
      text: 'Erro ao tentar te ouvir, tente esse formato novamente mais tarde',
      bgColor: StudentDesignSystem.config.colors.error[50]!,
      mainColor: StudentDesignSystem.config.colors.error[500]!,
    );
  }

  /// Each time to start a speech recognition session
  void startListening() async {
    lastWords = '';

    final options = SpeechListenOptions(
        onDevice: false,
        listenMode: ListenMode.confirmation,
        cancelOnError: true,
        partialResults: true,
        autoPunctuation: true,
        enableHapticFeedback: true);

    speech.listen(
      onResult: resultListener,
      localeId: currentLocaleId,
      listenOptions: options,
    );
    setState(() {});
  }

  void stopListening() async {
    await speech.stop();
    widget.onAnswer(lastWords);
    setState(() {});
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
    if (result.finalResult) {
      widget.onAnswer(lastWords);
    }
  }
}
