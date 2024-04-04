import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class StudentPictureWidget {
  StudentPictureWidget._();
  static Widget asset(
    String image, {
    BoxFit? fit,
    double? width,
    double? height,
    bool? repeatAnimation,
  }) {
    if (image.contains('.svg')) {
      return SvgPicture.asset(
        image,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
    }

    if (image.contains('.json')) {
      return Lottie.asset(
        image,
        width: width,
        height: height,
        repeat: repeatAnimation,
      );
    }
    return Image.asset(
      image,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
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
