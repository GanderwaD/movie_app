import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/shared/widgets/image/cached_network_image.dart';
import 'package:movie_app/src/ui/shared/widgets/theme/colors.dart';

import '../../../models/movie.dart';
import 'text_widget/text_widget.dart';

class MovieBox extends StatelessWidget {
  final Movie movie;

  const MovieBox({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Stack(
        children: [
          CNImage(
            imgUrl: movie.fullImageUrl,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: _GetPopularity(
              voteAverage: movie.voteAverage,
              //voteCount: movie.voteCount,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: FrontBanner(text: movie.title),
          ),
        ],
      ),
    );
  }
}

class FrontBanner extends StatelessWidget {
  const FrontBanner({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        color: Colors.grey,
        height: 40,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _GetPopularity extends StatelessWidget {
  const _GetPopularity({
    Key? key,
    required this.voteAverage,
    //required this.voteCount,
  }) : super(key: key);

  final double voteAverage;
  //final int voteCount;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.grey.shade200.withOpacity(0.3),
        child: Column(
          children: [
            const Icon(
              Icons.star,
              color: goldGlaze,
            ),
            TextWidget("$voteAverage", color: Colors.white),
          ],
        ),
      ),
    );
  }
}
