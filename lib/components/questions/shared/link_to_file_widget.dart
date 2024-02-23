import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_design_system/config/config.dart';
import 'package:student_design_system/spacing/spacing.dart';

import '../../../typography/box_text.dart';

class LinkToFileContentWidget extends StatelessWidget {
  final String link;

  const LinkToFileContentWidget({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    if (_isImageLink(link)) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CachedNetworkImage(
          imageUrl: link,
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
                Lottie.asset(
                  'assets/audio/audio-wave.json',
                  package: 'student_design_system',
                  fit: BoxFit.fitHeight,
                  repeat: true,
                  width: double.maxFinite,
                  height: 96,
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
                    child: InkWell(
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
                      child: const Icon(Icons.play_arrow),
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
