import 'package:flutter/material.dart';

import '../image/picture_widget.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String? icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          if (icon != null) StudentPictureWidget.asset(icon!),
        ],
      ),
    );
  }
}
