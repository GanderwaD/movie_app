import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router/router_constants.dart';
import '../../router/router_object.dart';
import '../shared/widgets/bases/base_scaffold.dart';
import '../shared/widgets/text_widget/text_widget.dart';
import 'account_view.dart';
import '../../models/auth/auth_provider.dart';
import 'profile/profile_view.dart';

class AuthChecker extends ConsumerWidget with RouterObject {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  String get routeKey => authCheckerKey;

  @override
  String get routePath => authCheckerPath;

  //  Notice here we aren't using stateless/stateful widget. Instead we are using
  //  a custom widget that is a consumer of the state.
  //  So if any data changes in the state, the widget will be updated.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  now the build method takes a new parameter ScopeReader.
    //  this object will be used to access the provider.

    //  now the following variable contains an asyncValue so now we can use .when method
    //  to imply the condition
    final authState = ref.watch(authStateProvider);
    return authState.when(
      data: (data) {
        if (data != null) {
          return const ProfileView();
        } else {
          return const AccountView();
        }
      },
      loading: () => const BaseScaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (e, trace) => BaseScaffold(
        body: Center(
          child: TextWidget(e.toString()),
        ),
      ),
    );
  }
}
