/*
 * ---------------------------
 * File : account_view_controller.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router_helper.dart';

final accountViewProvider = ChangeNotifierProvider((ref) {
  return AccountViewController();
});

class AccountViewController extends ChangeNotifier {
  AccountViewController() {
    init();
  }

  PageController accountController = PageController();
  Color left = Colors.black;
  Color right = Colors.white;

  void init() {}

  @override
  void dispose() {
    accountController.dispose();
    super.dispose();
  }

  goBack(context) {
    R.instance.popWidget(context);
  }

  onPageChanged(int i, context) {
    FocusScope.of(context).requestFocus(FocusNode());
    if (i == 0) {
      right = Colors.white;
      left = Colors.black;
    } else if (i == 1) {
      right = Colors.black;
      left = Colors.white;
    }
    notifyListeners();
  }

  void onSignInButtonPress() {
    accountController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    notifyListeners();
  }

  void onSignUpButtonPress() {
    accountController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    notifyListeners();
  }
}
