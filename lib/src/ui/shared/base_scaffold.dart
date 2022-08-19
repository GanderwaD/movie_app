import 'package:flutter/material.dart';

import '../../utils/keyboard_utils.dart';
import '../../widgets/text_widget/text_widget.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.appBarTitle,
    this.showBackButton = true,
  });
  final Widget body;
  final AppBar? appBar;
  final String? appBarTitle;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard,
      child: Scaffold(
        appBar: appBar ?? (appBarTitle == null ? null : AppBar(
          title: TextWidget(appBarTitle!),
          automaticallyImplyLeading: showBackButton,
        )),
        body: body,
      ),
    );
  }
}
