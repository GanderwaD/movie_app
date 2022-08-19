
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/router/router.dart';
import 'src/widgets/theme/dark_theme.dart';
import 'src/widgets/theme/light_theme.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider(ref));
    return MaterialApp.router(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      backButtonDispatcher: router.backButtonDispatcher,
      routerDelegate: router.delegate,
      routeInformationParser: router.parser,
    );
  }
}
