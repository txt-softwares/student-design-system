import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';

class StudentTTS {
  FlutterTts flutterTts = FlutterTts();

  List<String>? languages;
  double volume = 1.0;
  double pitch = 1.0;
  double speechRate = 0.5;
  static const String langCode = "en-US";

  void init({String lang = langCode}) async {
    languages = List<String>.from(await flutterTts.getLanguages);

    if (Platform.isIOS) {
      await flutterTts.setSharedInstance(true);
      await flutterTts.setIosAudioCategory(
        IosTextToSpeechAudioCategory.playback,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
          IosTextToSpeechAudioCategoryOptions.defaultToSpeaker
        ],
        IosTextToSpeechAudioMode.defaultMode,
      );
    }
    initSetting(lang);
  }

  void initSetting(String lang) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setLanguage(lang);
  }

  void speak(String text) async {
    await flutterTts.speak(text);
  }

  void stop() async {
    await flutterTts.stop();
  }
}
