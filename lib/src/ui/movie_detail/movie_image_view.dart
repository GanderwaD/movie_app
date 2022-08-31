import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../widgets/image/cached_network_image.dart';

class MovieImageView extends ConsumerWidget with RouterObject {
  const MovieImageView(
    this.imageUrl, {
    Key? key,
  }) : super(key: key);
  final String imageUrl;

  @override
  String get routeKey => movieImageKey;

  @override
  String get routePath => movieImagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: InteractiveViewer(
        child: Center(
          child: CNImage(
            imgUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
