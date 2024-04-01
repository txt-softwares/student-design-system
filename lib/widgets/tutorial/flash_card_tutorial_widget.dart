import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:student_design_system/student_design_system.dart';

class StudentFlashCardTutorialWidget extends StatefulWidget {
  const StudentFlashCardTutorialWidget({
    super.key,
    required this.tutorialPageIndex,
    required this.arrowIcon,
    required this.onTap,
  });
  final int tutorialPageIndex;
  final String arrowIcon;
  final Function() onTap;

  @override
  State<StudentFlashCardTutorialWidget> createState() =>
      _StudentFlashCardTutorialWidgetState();
}

class _StudentFlashCardTutorialWidgetState
    extends State<StudentFlashCardTutorialWidget> {
  double rotationAngle = 0;
  bool isRotated = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        isRotated = !isRotated;
        if (isRotated) {
          rotationAngle = widget.tutorialPageIndex == 1 ? 0.785398 : -0.785398;
        } else {
          rotationAngle = 0.0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
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
                top: 120,
                right: 24,
                left: 24,
                bottom: 0,
              ),
              children: [
                BoxText.bodyXLargeMedium(
                  widget.tutorialPageIndex == 1
                      ? 'Toque na tela para continuar o tutorial'
                      : 'Toque na tela para sair do tutorial',
                  align: TextAlign.center,
                  color: dsColors.white,
                ),
                const SizedBox(height: 100),
                BoxText.heading3(
                  widget.tutorialPageIndex == 1
                      ? 'Arraste para a direita se tiver aprendido o cartão'
                      : 'Arraste para a esquerda se ainda estiver aprendendo',
                  align: TextAlign.center,
                  color: dsColors.white,
                ),
                const SpaceVertical.x10(),
                Transform.rotate(
                  angle: rotationAngle,
                  child: const Text(
                    '👆',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 96),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: BoxText.heading5(
                widget.tutorialPageIndex == 1
                    ? 'Aqui você verá quantos cartões foram marcados como ”Aprendidos”'
                    : 'Aqui você verá quantos cartões foram marcados como ”Ainda aprendendo”',
                align: TextAlign.center,
                color: dsColors.white,
              ),
            ),
            const SpaceVertical.x4(),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(
                  widget.tutorialPageIndex == 1 ? 0 : math.pi),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 84,
                  ),
                  StudentPictureWidget.asset(widget.arrowIcon),
                  Container(
                    padding: const EdgeInsets.all(24).copyWith(right: 0),
                    decoration: BoxDecoration(
                      color: dsColors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        bottomLeft: Radius.circular(24),
                      ),
                    ),
                    child: Container(
                      height: 64,
                      width: 56,
                      decoration: BoxDecoration(
                        color: widget.tutorialPageIndex == 1
                            ? dsColors.secondaryGreen
                            : dsColors.primaryRed,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: BoxText.bodyXLargeBold(
                          '0',
                          color: dsColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
