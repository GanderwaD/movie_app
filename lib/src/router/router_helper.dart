import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';
import 'router_action.dart';
import 'router_object.dart';

class R {
  late WidgetRef ref;
  static final R _instance = R._internal();
  R._internal();

  static R get instance => _instance;

  add({required RouterObject object, Map<String, dynamic>? arguments}) {
    _update(ActionType.add, object, arguments);
  }

  remove({Map<String, dynamic>? arguments}) {
    _update(ActionType.remove, null, arguments);
  }

  replace({required RouterObject object, Map<String, dynamic>? arguments}) {
    _update(ActionType.replace, object, arguments);
  }

  replaceAll({required RouterObject object, Map<String, dynamic>? arguments}) {
    _update(ActionType.replaceAll, object, arguments);
  }

  popWidget(BuildContext context) {
    updateBarrierState(true);

    Navigator.of(context).pop();
  }

  updateBarrierState(bool dismissible) {
    ref.read(routerProvider(ref)).updateBarrierState(dismissible);
  }

  _update(
      ActionType type, RouterObject? object, Map<String, dynamic>? arguments) {
    ref.read(routerProvider(ref)).currentAction =
        RouterAction(actionType: type, object: object, arguments: arguments);
  }
}
