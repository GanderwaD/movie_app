/*
 * ---------------------------
 * File : profile_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../widgets/base_scaffold.dart';
import '../widgets/drawer.dart';
import '../widgets/text_widget/text_size.dart';
import '../widgets/text_widget/text_widget.dart';

class ProfileView extends ConsumerWidget with RouterObject {
  const ProfileView({Key? key}) : super(key: key);

  @override
  String get routeKey => profileKey;

  @override
  String get routePath => profilePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(
      body: _getBody(context),
      drawer: const Drawer(
        child: GetDrawer(),
      ),
    );
  }

  _getBody(context) {
    return  CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          pinned: true,
          leading: IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu, size: 30.0),
          ),
          backgroundColor: Colors.red,
          title: const TextWidget('Profile',
              color: Colors.blue, maxLines: 1, textSize: TextSize.uLarge),
        )
      ],
    );
  }
}
