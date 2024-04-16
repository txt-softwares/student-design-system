import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../config/ds_config.dart';

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

  static Widget network(
    String url, {
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: StudentDesignSystem.config.colors.primaryRed,
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Text(
          'Ops! ocorreu um erro\nao carregar a imagem.',
          textAlign: TextAlign.center,
        ),
      ),
      height: height,
      width: width,
      fit: fit,
    );
  }

  static Widget circle(
    String image, {
    double? width,
    double? height,
  }) {
    if (image.contains('http')) {
      return SizedBox(
        width: width,
        height: height,
        child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(image),
        ),
      );
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
