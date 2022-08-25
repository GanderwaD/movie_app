/*
 * ---------------------------
 * File : splash_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_path.dart';
import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../../widgets/base_scaffold.dart';
import '../../constants/widget_key_constants.dart';
import 'splash_controller.dart';

class SplashView extends ConsumerWidget with RouterObject {
  const SplashView({Key? key}) : super(key: key);

  @override
  String get routeKey => splashKey;

  @override
  String get routePath => splashPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final c =  ref.watch(splashProvider);
    return BaseScaffold(
      key: wKeySplashView,
      body: Center(
        child: Image.asset(APath.iconLogo()),
      ),
    );
  }
}
