import 'package:flutter/material.dart';

import '../../../../router/router_delegate.dart';




loaderDialog() {
  BuildContext? context = appNavigatorKey.currentContext;
  if (context == null) {
    return Future.value(false);
  }
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Center(child: CircularProgressIndicator()),
      ),
    ),
  );
}