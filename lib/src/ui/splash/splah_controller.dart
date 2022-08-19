import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router_helper.dart';
import '../home/home_view.dart';

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
    R.instance.replaceAll(object: const HomeView());
    
  }
}
