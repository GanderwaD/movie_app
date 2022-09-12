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
import 'package:movie_app/src/ui/account/profile/profile_controller.dart';

import '../../../router/router_constants.dart';
import '../../../router/router_object.dart';
import '../../shared/widgets/bases/base_scaffold.dart';
import '../../shared/widgets/buttons/raised_button_widget.dart';
import '../../shared/widgets/text_widget/text_size.dart';
import '../../shared/widgets/text_widget/text_widget.dart';
import '../auth/auth_model.dart';
import '../auth/auth_provider.dart';

class ProfileView extends ConsumerWidget with RouterObject {
  const ProfileView({Key? key}) : super(key: key);

  @override
  String get routeKey => profileKey;

  @override
  String get routePath => profilePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    final controller = ref.watch(profileViewProvider);
    return BaseScaffold(
      body: _getBody(
        context,
        auth,
        controller,
      ),
    );
  }

  _getBody(
    context,
    Authentication auth,
    ProfileViewController controller,
  ) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          pinned: true,
          leading: IconButton(
            onPressed: () => controller.goBack(context),
            icon: const Icon(Icons.arrow_back, size: 30.0),
          ),
          backgroundColor: Colors.red,
          title: const TextWidget('Profile',
              color: Colors.blue, maxLines: 1, textSize: TextSize.uLarge),
        ),
        SliverToBoxAdapter(
          child: RaisedButtonWidget(
            text: 'signOut',
            onPressed: () => auth.signOut(),
          ),
        )
      ],
    );
  }
}
