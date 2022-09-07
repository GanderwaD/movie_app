/*
 * ---------------------------
 * File : profile_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:firebase_auth/firebase_auth.dart';
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
    final user = FirebaseAuth.instance.currentUser;
    return BaseScaffold(
      body: _getBody(context,user),
    );
  }

  _getBody(context, User? user) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          centerTitle: true,
          pinned: true,
          backgroundColor: Colors.red,
          title: TextWidget('Profile',
              color: Colors.blue, maxLines: 1, textSize: TextSize.uLarge),
        ),
        SliverToBoxAdapter(
          child: TextWidget("logged in as \n${user?.email}"),
        ),
        SliverToBoxAdapter(
          child: OutlinedButton(onPressed: () => FirebaseAuth.instance.signOut(), child: const TextWidget("logout<3"))
        ),
      ],
    );
  }
}
