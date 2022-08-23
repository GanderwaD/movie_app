import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = ChangeNotifierProvider((ref) {
  return SearchController();
});

class SearchController extends ChangeNotifier {
  SearchController() {
    init();
  }
  final TextEditingController textEditingController = TextEditingController();

  void init() {}
}
