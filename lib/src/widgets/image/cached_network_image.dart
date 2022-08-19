
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'asset_image.dart';
/*
 * ---------------------------
 * File : cached_network_image.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * Date : Sat Jan 22 2022 7:45:01 AM
 * Copyright (c) 2022
 * ---------------------------
 */

///Network images
class CNImage extends StatelessWidget {
  final String imgUrl;
  final double? height;
  final double? width;
  final String placeholder;
  final BoxFit fit;

  const CNImage({
    Key? key,
    required this.imgUrl,
    this.placeholder = '',
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imgUrl.isEmpty
        ? AImage(
            imgPath: placeholder,
            height: height,
            width: width,
            fit: fit,
          )
        : CachedNetworkImage(
            imageUrl: imgUrl,
            errorWidget: (c, e, s) {
              return (placeholder == "")
                  ? const SizedBox.shrink()
                  : AImage(
                      imgPath: placeholder,
                      height: height,
                      width: width,
                      fit: fit,
                    );
            },
            placeholder: (c, e) {
              return (placeholder == "")
                  ? const SizedBox.shrink()
                  : AImage(
                      imgPath: placeholder,
                      height: height,
                      width: width,
                      fit: fit,
                    );
            },
            fadeOutDuration: const Duration(milliseconds: 100),
            fadeOutCurve: Curves.easeOut,
            fadeInDuration: const Duration(milliseconds: 200),
            fadeInCurve: Curves.easeIn,
            height: height,
            width: width,
            fit: fit,
          );
  }
}
