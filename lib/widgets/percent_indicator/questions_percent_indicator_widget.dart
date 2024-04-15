import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../student_design_system.dart';

class QuestionsPercentIndicatorWidget extends StatefulWidget {
  const QuestionsPercentIndicatorWidget({
    super.key,
    required this.totalQuestions,
    required this.finishedQuestions,
  });
  final int totalQuestions;
  final int finishedQuestions;

  @override
  State<QuestionsPercentIndicatorWidget> createState() =>
      _QuestionsPercentIndicatorWidgetState();
}

class _QuestionsPercentIndicatorWidgetState
    extends State<QuestionsPercentIndicatorWidget> {
  bool canPop = false;
  @override
  Widget build(BuildContext context) {
    final dsColor = StudentDesignSystem.config.colors;
    return PopScope(
      canPop: canPop,
      onPopInvoked: (value) async {
        setState(() {
          canPop = !value;
        });

        if (canPop) {
          showModalBottomSheet(
            context: context,
            builder: (context) => StudentModalWidget(
              title: 'Sair da atividade',
              description: 'Ei! Você vai perder o seu progresso se sair agora.',
              confirmTitle: 'Continuar',
              onConfirm: () {
                setState(() {
                  canPop = false;
                });
                Navigator.pop(context);
              },
              cancelTitle: 'Sair',
              onCancel: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 0,
          top: 16,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => StudentModalWidget(
                    title: 'Sair da atividade',
                    description:
                        'Ei! Você vai perder o seu progresso se sair agora.',
                    confirmTitle: 'Continuar',
                    onConfirm: () {
                      Navigator.pop(context);
                    },
                    cancelTitle: 'Sair',
                    onCancel: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/images/back.svg',
                package: 'student_design_system',
              ),
            ),
            Expanded(
              child: LinearPercentIndicator(
                lineHeight: 12,
                percent: widget.finishedQuestions / widget.totalQuestions,
                backgroundColor: dsColor.dark[100],
                progressColor: dsColor.primaryPurple,
                barRadius: const Radius.circular(50),
                padding: const EdgeInsets.symmetric(horizontal: 30),
              ),
            ),
            BoxText.bodyLargeBold(
                '${widget.finishedQuestions}/${widget.totalQuestions}'),
          ],
        ),
      ),
    );
  }
}
