import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class StudentPictureWidget {
  StudentPictureWidget._();
  static Widget asset(String image,
      {Color? color, AnimationController? animationController, BoxFit? fit}) {
    if (image.contains('.svg')) {
      return SvgPicture.asset(
        image,
        fit: fit ?? BoxFit.contain,
      );
    }

    if (image.contains('.json')) {
      return Lottie.asset(
        image,
        package: 'design_system',
      );
    }
    return Image.asset(
      image,
      fit: BoxFit.contain,
      color: color,
    );
  }

  static Widget circle(String? file, {Color? color}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            file ?? '',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
