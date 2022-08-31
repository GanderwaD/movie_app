
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/router/router.dart';
import 'src/ui/widgets/theme/dark_theme.dart';
import 'src/ui/widgets/theme/light_theme.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider(ref));
    return MaterialApp.router(
      title: 'MovieApp',
      theme: lightTheme,
      darkTheme: darkTheme,
      backButtonDispatcher: router.backButtonDispatcher,
      routerDelegate: router.delegate,
      routeInformationParser: router.parser,
    );
  }
}
