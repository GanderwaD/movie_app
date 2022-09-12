import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router_helper.dart';
import '../../movies/movies_view.dart';
import '../../shared/widgets/bases/base_changenotifier.dart';
import '../../shared/widgets/dialog/app_dialog.dart';
import '../auth/auth_provider.dart';
import '../profile/profile_view.dart';

final loginControllerProvider = ChangeNotifierProvider((ref) {
  return LoginController(ref);
});

class LoginController extends BaseChangeNotifier {
  LoginController(this.ref) {
    init();
  }
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final Ref ref;
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool obscureTextPassword = true;
  bool toggleLoginView = true;
  bool toggleLoginBtn = false;

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  void init() {}

  void toggleSignInButton() async {
    setLoginBtn(true);
    bool result = await ref.read(authProvider).signInWithEmailAndPasswordService(
          loginEmailController.text,
          loginPasswordController.text,
        );
    appDialog(result ? "success" : "unsuccess", confirmBtn: "ok");
    if (result) {
      R.instance.add(object: const ProfileView());
    } else {
      const MoviesView();
    }
    notifyListeners();
  }

  void toggleLogin() {
    setLogin(true);
    obscureTextPassword = !obscureTextPassword;
    notifyListeners();
  }

  setLogin(bool val) {
    toggleLoginView = val;
    notifyListeners();
  }

  setLoginBtn(bool val) {
    toggleLoginBtn = val;
    notifyListeners();
  }
}
