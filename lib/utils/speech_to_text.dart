import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

final sttProvider = Provider.family.autoDispose<StudentSTT, int>((ref, id) {
  return StudentSTT();
});

class StudentSTT {
  final SpeechToText speech = SpeechToText();

  final String currentLocaleId = 'en_US';

  Future<bool> askPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
    ].request();

    return statuses.entries
        .every((element) => element.value == PermissionStatus.granted);
  }

  void init({
    required bool mounted,
    required Function() onCantSpeak,
    required Function() onStopedError,
    required Function(String) onAnswer,
    required Function() onStart,
    required Function() onFinishAnswer,
  }) async {
    try {
      final permission = await askPermission();

      if (!permission) {
        onCantSpeak();
        return;
      }

      var hasSpeech = await speech.initialize(
        onError: (error) => _onError(
          error,
          onStopedError,
          onAnswer,
          onStart,
          onFinishAnswer,
        ),
      );
      if (!hasSpeech) {
        onCantSpeak();
      }
      if (!mounted) return;
    } catch (e) {
      onCantSpeak();
    }
  }

  void _onError(
    SpeechRecognitionError errorNotification,
    Function() onStopedError,
    Function(String) onAnswer,
    Function() onStart,
    Function() onFinishAnswer,
  ) async {
    log('ERROR: ${errorNotification.errorMsg}');

    if (errorNotification.errorMsg == 'error_no_match') {
      await speech.stop();
      await speech.cancel();
      startListening(
          onAnswer: onAnswer, onStart: onStart, onFinishAnswer: onFinishAnswer);
      return;
    }

    await stop(onFinishAnswer: onFinishAnswer);
    onStopedError();
  }

  /// Each time to start a speech recognition session
  void startListening({
    required Function(String) onAnswer,
    required Function() onStart,
    required Function() onFinishAnswer,
  }) async {
    onAnswer('');

    final options = SpeechListenOptions(
      onDevice: false,
      listenMode: ListenMode.dictation,
      cancelOnError: true,
      partialResults: true,
      autoPunctuation: true,
      enableHapticFeedback: true,
    );

    speech.listen(
      onResult: (result) => _resultListener(result, onAnswer, onFinishAnswer),
      localeId: currentLocaleId,
      listenOptions: options,
    );
    onStart();
  }

  Future<void> stop({required Function()? onFinishAnswer}) async {
    await speech.stop();
    await speech.cancel();
    if (onFinishAnswer != null) {
      onFinishAnswer();
    }
  }

  void _resultListener(
    SpeechRecognitionResult result,
    Function(String) onAnswer,
    Function() onFinishAnswer,
  ) {
    //TODO: get the word near of the result
    onAnswer(result.recognizedWords);

    if (result.finalResult) {
      stop(onFinishAnswer: onFinishAnswer);
    }
  }
}
