import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:student_design_system/student_design_system.dart';

import '../../shared/head_question_widget.dart';
import 'speak_mixin.dart';

class SpeakTypeWidget extends StatefulWidget {
  const SpeakTypeWidget({
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
  State<SpeakTypeWidget> createState() => _SpeakTypeWidgetState();
}

class _SpeakTypeWidgetState extends State<SpeakTypeWidget> with SpeakMixin {
  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  @override
  void dispose() {
    super.dispose();
    speech.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: HeadQuestionWidget(
            file: null,
            title: widget.content,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.file != null)
                PlayAudio(
                  audioUrl: widget.file!,
                ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.all(24).copyWith(
                      left: widget.file != null ? 12 : 24, top: 0, bottom: 0),
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
                    text: highlightWords(widget.expectedAnswer, lastWords),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: speech.isNotListening ? startListening : stopListening,
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
              child: !speech.isNotListening
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
        ),
      ],
    );
  }
}

class PlayAudio extends StatefulWidget {
  const PlayAudio({
    super.key,
    required this.audioUrl,
  });
  final String audioUrl;
  @override
  State<PlayAudio> createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Center(
        child: GestureDetector(
          onTap: () async {
            if (!isPlaying) {
              await audioPlayer.play(UrlSource(widget.audioUrl));
            } else {
              audioPlayer.stop();
            }
            setState(() {
              isPlaying = !isPlaying;
            });
          },
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
    );
  }
}
