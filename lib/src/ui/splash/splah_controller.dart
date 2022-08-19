/*
 * ---------------------------
 * File : splah_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/ui/landing_page/landing_view.dart';

import '../../router/router_helper.dart';

final splashProvider = ChangeNotifierProvider(
  (ref) {
    return SplashController(ref);
  },
);

class SplashController extends ChangeNotifier {
  Ref ref;
  SplashController(this.ref) {
    init();
  }

  void init() async {
    await Future.delayed(const Duration(seconds: 1));
    R.instance.replaceAll(object: const LandingView());
    
  }
}
