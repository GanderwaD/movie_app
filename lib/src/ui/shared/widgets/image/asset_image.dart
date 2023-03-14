import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
/*
 * ---------------------------
 * File : asset_image.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Sat Jan 22 2022 7:41:16 AM
 * Copyright (c) 2022
 * ---------------------------
 */


class AImage extends StatelessWidget {
  final String imgPath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;
  const AImage({
    Key? key,
    required this.imgPath,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (imgPath.contains('.svg'))
        ? SvgPicture.asset(
            imgPath,
            width: width,
            height: height,
            fit: fit,
            color: color,
          )
        : Image.asset(
            imgPath,
            width: width,
            height: height,
            fit: fit,
            color: color,
          );
  }
}
