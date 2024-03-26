import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class StudentReorderTutorialWidget extends StatefulWidget {
  const StudentReorderTutorialWidget({
    super.key,
    required this.tutorialPageIndex,
    required this.onTap,
  });
  final int tutorialPageIndex;
  final Function() onTap;

  @override
  State<StudentReorderTutorialWidget> createState() =>
      _StudentReorderTutorialWidgetState();
}

class _StudentReorderTutorialWidgetState
    extends State<StudentReorderTutorialWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final dsColors = StudentDesignSystem.config.colors;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Colors.black.withOpacity(0.8),
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                top: 100,
                right: 24,
                left: 24,
                bottom: 0,
              ),
              children: [
                BoxText.bodyXLargeMedium(
                  'Toque na tela para sair do tutorial',
                  align: TextAlign.center,
                  color: dsColors.white,
                ),
                const SpaceVertical.x10(),
                BoxText.heading3(
                  'Segure e arraste no item para ordenar',
                  align: TextAlign.center,
                  color: dsColors.white,
                ),
                Row(
                  children: [
                    const SizedBox(width: 74),
                    Expanded(
                      child: SizedBox(
                        height: 180,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: dsColors.white,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              child: AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset:
                                        Offset(0, _controller.value * 50 - 5),
                                    child: child,
                                  );
                                },
                                child: const Text(
                                  '👆',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 96),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
