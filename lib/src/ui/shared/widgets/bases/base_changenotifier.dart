// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class BaseChangeNotifier extends ChangeNotifier {
  bool _disposed = false;
  BaseChangeNotifier() {
    initialize();
  }

  Future<void> initialize()async{}

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
