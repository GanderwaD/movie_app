import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router_helper.dart';
import '../../shared/widgets/bases/base_changenotifier.dart';

final profileViewProvider = ChangeNotifierProvider((ref) {
  return ProfileViewController();
});

class ProfileViewController extends BaseChangeNotifier {
  ProfileViewController() {
    init();
  }

  void init() {}


    goBack(context) {
    R.instance.popWidget(context);
  }
}
