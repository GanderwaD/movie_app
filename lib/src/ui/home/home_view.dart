/*
 * ---------------------------
 * File : home_view.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import 'home_controller.dart';

class HomeView extends ConsumerWidget with RouterObject {
  const HomeView({super.key});

  @override
  String get routeKey => homeKey;

  @override
  String get routePath => homePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(homeProvider);
    return const Center(child: Text('HomeView'));
  }
}
