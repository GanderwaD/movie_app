import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/widgets/bases/base_changenotifier.dart';
import '../../shared/widgets/dialog/app_dialog.dart';
import '../../../models/auth/auth_provider.dart';

final registerControllerProvider = ChangeNotifierProvider((ref) {
  return RegisterController(ref);
});

class RegisterController extends BaseChangeNotifier {
  RegisterController(this.ref) {
    init();
  }
  final Ref ref;
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeName = FocusNode();
  bool toggleSignUpBtn = false;
  bool toggleSignUpView = false;
  bool toggleSignUpConfirm = false;

  bool obscureTextPassword = true;
  bool obscureTextConfirmPassword = true;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
    super.dispose();
  }

  void init() {}

  void toggleSignUpButton() async {
    setSignUpBtn(true);
    bool result = await ref.read(authProvider).signUpWithEmailAndPasswordService(
        signupEmailController.text, signupPasswordController.text);
    appDialog(result ? "success" : "unsuccess",confirmBtn: "ok");
    notifyListeners();
  }

  void toggleSignup() {
    setSignUp(true);
    obscureTextPassword = !obscureTextPassword;
    notifyListeners();
  }

  void toggleSignupConfirm() {
    setSignUpConfirm(true);
    obscureTextConfirmPassword = !obscureTextConfirmPassword;
    notifyListeners();
  }

  setSignUp(bool val) {
    toggleSignUpView = val;
    notifyListeners();
  }

  setSignUpBtn(bool val) {
    toggleSignUpBtn = val;
    notifyListeners();
  }

  setSignUpConfirm(bool val) {
    toggleSignUpConfirm = val;
    notifyListeners();
  }
}
