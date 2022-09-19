import 'package:flutter/material.dart';

import '../../../models/movie.dart';
import 'image/cached_network_image.dart';
import 'text_widget/text_widget.dart';
import 'theme/colors.dart';

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
            bottom: 42,
            left: 2,
            child: _GetPopularity(
              voteAverage: movie.voteAverage,
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
        color: americanBlue.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: goldGlaze,
              ),
              TextWidget("$voteAverage", color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
