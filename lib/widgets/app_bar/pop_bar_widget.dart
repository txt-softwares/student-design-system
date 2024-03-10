import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PopBarWidget extends StatelessWidget {
  const PopBarWidget({
    super.key,
    required this.sufix,
  });
  final Widget? sufix;

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
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/images/back.svg',
              package: 'student_design_system',
            ),
          ),
          const Spacer(),
          if (sufix != null) sufix!,
        ],
      ),
    );
  }
}
