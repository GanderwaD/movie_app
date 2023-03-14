import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router_helper.dart';
import '../../shared/widgets/bases/base_changenotifier.dart';
import '../../../models/auth/auth_provider.dart';

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
  bool isGoogleSignIn = false;
  bool isSignedIn = false;

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  void init() {}

  onTapGoogleSignIn(context) async {
    setGoogleLogin(true);
    bool result = await ref.read(authProvider).signInWithGoogle();
    setGoogleLogin(false);
    if (result) {
      R.instance.popWidget(context);
      ref.read(authProvider).authStateChange;
      setSignedIn(true);
    }
    notifyListeners();
  }

  void toggleSignInButton(context) async {
    setLoginBtn(true);
    bool result =
        await ref.read(authProvider).signInWithEmailAndPasswordService(
              loginEmailController.text,
              loginPasswordController.text,
            );
    setLoginBtn(false);
    if (result) {
      R.instance.popWidget(context);
      ref.read(authProvider).authStateChange;
      setSignedIn(true);
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

  setGoogleLogin(bool val) {
    isGoogleSignIn = val;
    notifyListeners();
  }

  setSignedIn(bool val) {
    isSignedIn = val;
    notifyListeners();
  }

  setLoginBtn(bool val) {
    toggleLoginBtn = val;
    notifyListeners();
  }
}
