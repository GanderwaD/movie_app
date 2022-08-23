import 'package:flutter/material.dart';
import 'package:movie_app/src/ui/shared/drawer.dart';
import 'package:movie_app/src/widgets/navbar/bottom_navbar.dart';

import '../../utils/keyboard_utils.dart';
import '../../widgets/text_widget/text_widget.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.appBarTitle,
    this.showBackButton = true,
    this.drawer,
    this.navbar,
  });
  final Widget body;
  final AppBar? appBar;
  final String? appBarTitle;
  final Drawer? drawer;
  final BottomNavbar? navbar;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard,
      child: Scaffold(
        appBar: appBar ??
            (appBarTitle == null
                ? null
                : AppBar(
                    title: TextWidget(appBarTitle!),
                    automaticallyImplyLeading: showBackButton,
                  )),
        drawer: drawer,
        bottomNavigationBar: navbar,
        body: body,
      ),
    );
  }
}
