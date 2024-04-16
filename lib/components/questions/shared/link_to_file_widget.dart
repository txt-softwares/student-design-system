import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:student_design_system/student_design_system.dart';

class LinkToFileContentWidget extends StatelessWidget {
  final String link;

  const LinkToFileContentWidget({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    if (_isImageLink(link)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: StudentPictureWidget.network(
          link,
          height: 200,
          fit: BoxFit.fitHeight,
        ),
      );
    } else if (_isAudioLink(link)) {
      return AudioPlayerWidget(audioUrl: link);
    } else {
      return Container();
    }
  }

  bool _isImageLink(String link) {
    return link.endsWith('.jpg') ||
        link.endsWith('.jpeg') ||
        link.endsWith('.png');
  }

  bool _isAudioLink(String link) {
    return link.endsWith('.mp3') ||
        link.endsWith('.wav') ||
        link.endsWith('webm') ||
        link.endsWith('.ogg');
  }
}

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerWidget({super.key, required this.audioUrl});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
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
    return Container(
      child: isPlaying
          ? Column(
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
                  'Ouvindo...',
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
                      child: SvgPicture.asset(
                        'assets/images/play-primary.svg',
                        package: 'student_design_system',
                      ),
                    ),
                  ),
                ),
                const SpaceVertical.x4(),
                BoxText.bodyLargeSemiBold(
                  'Toque para ouvir o áudio',
                  color: StudentDesignSystem.config.colors.dark[500],
                ),
              ],
            ),
    );
  }
}
