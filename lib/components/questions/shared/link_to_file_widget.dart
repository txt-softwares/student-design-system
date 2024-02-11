import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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

  AudioPlayerWidget({super.key, required this.audioUrl});

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  double _amplitude = 50.0;
  double _frequency = 1.5;
  double _animationValue = 0.0;

  @override
  void initState() {
    super.initState();
  }

  void _startAnimation() {
    Timer.periodic(Duration(milliseconds: 16), (timer) {
      setState(() {
        _animationValue += 0.1;
      });
    });
  }

  void _stopAnimation() {
    setState(() {
      _animationValue = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            child: CustomPaint(
              painter: AudioWavePainter(
                amplitude: _amplitude,
                frequency: _frequency,
                animationValue: _animationValue,
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (!isPlaying) {
                await audioPlayer.play(UrlSource(widget.audioUrl));
                _startAnimation();
              } else {
                audioPlayer.stop();
                _stopAnimation();
              }
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            child: Text(isPlaying ? 'Pause Audio' : 'Play Audio'),
          ),
        ],
      ),
    );
  }
}

class AudioWavePainter extends CustomPainter {
  final double amplitude;
  final double frequency;
  final double animationValue;

  AudioWavePainter({
    required this.amplitude,
    required this.frequency,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();

    for (double i = 0; i <= size.width; i++) {
      final y =
          sin((i / size.width * frequency * pi) + animationValue) * amplitude;
      if (i == 0) {
        path.moveTo(i, size.height / 2 + y);
      } else {
        path.lineTo(i, size.height / 2 + y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
