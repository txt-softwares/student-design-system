import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_design_system/student_design_system.dart';

class PopBarWidget extends StatelessWidget {
  const PopBarWidget({
    super.key,
    required this.sufix,
    this.timeSeconds,
  });
  final Widget? sufix;
  final int? timeSeconds;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          const Spacer(),
          if (timeSeconds != null)
            BoxText.bodyXLargeSemiBold('${timeSeconds!},0 segundos'),
          const Spacer(),
          if (sufix != null) sufix!,
        ],
      ),
    );
  }
}
