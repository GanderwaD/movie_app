import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router_helper.dart';
import '../../shared/widgets/bases/base_changenotifier.dart';
import '../auth/auth_provider.dart';

final profileViewProvider = ChangeNotifierProvider((ref) {
  return ProfileViewController(ref);
});

class ProfileViewController extends BaseChangeNotifier {
  ProfileViewController(this.ref) {
    init();
  }
  Ref ref;

  void init() {}
  goBack(context) {
    R.instance.popWidget(context);
  }

  signOut(context) {
    ref.read(authProvider).signOut();
    goBack(context);
    notifyListeners();
  }
}
