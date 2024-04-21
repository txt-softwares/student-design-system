import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:student_design_system/components/questions/types/quiz/speak/head_quiz_speak_widget.dart';
import 'package:student_design_system/components/questions/types/quiz/speak/quiz_speak_mixin.dart';
import 'package:student_design_system/student_design_system.dart';
import '../../../../../utils/text_to_speech.dart';

class QuizSpeakQuestionTypeWidget extends ConsumerStatefulWidget {
  const QuizSpeakQuestionTypeWidget({
    Key? key,
    required this.item,
    required this.onAnswer,
    required this.onCantSpeakNow,
  }) : super(key: key);

  final QuizQuestionModel item;
  final Function(String answer) onAnswer;
  final Function() onCantSpeakNow;

  @override
  ConsumerState<QuizSpeakQuestionTypeWidget> createState() =>
      _QuizSpeakQuestionTypeWidgetState();
}

class _QuizSpeakQuestionTypeWidgetState
    extends ConsumerState<QuizSpeakQuestionTypeWidget> with QuizSpeakMixin {
  @override
  void initState() {
    super.initState();

    print('LISTEN SPEAK FOR: ${widget.item.id}');

    Future.microtask(() {
      initSpeech();
    });
  }

  @override
  void dispose() {
    super.dispose();
    speech.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final words = ref.watch(wordProvider(widget.item.id));
    return Column(
      children: [
        Divider(
          color: StudentDesignSystem.config.colors.darkblue[200],
          height: 48,
          endIndent: 24,
          indent: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PlayAudioTTS(
                answer: widget.item.expectedAnswer,
              ),
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.all(24).copyWith(
                    left: widget.item.file != null ? 12 : 24,
                    top: 0,
                    bottom: 0,
                  ),
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
                    text: highlightWords(widget.item.expectedAnswer, words),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
            child: HeadQuizSpeakWidget(
              file: widget.item.file,
              title: widget.item.content,
            ),
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
              child: ref.watch(listenProvider(widget.item.id))
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

class PlayAudioTTS extends StatefulWidget {
  const PlayAudioTTS({
    super.key,
    required this.answer,
  });
  final String answer;
  @override
  State<PlayAudioTTS> createState() => _PlayAudioTTSState();
}

class _PlayAudioTTSState extends State<PlayAudioTTS> {
  bool isPlaying = false;

  final tts = StudentTTS();

  @override
  void initState() {
    super.initState();
    tts.init();
  }

  @override
  void dispose() {
    tts.stop();

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
              tts.speak(widget.answer);
            } else {
              tts.stop();
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
