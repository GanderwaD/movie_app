import 'package:flutter/material.dart';
import 'package:movie_app/src/widgets/text_widget/text_widget.dart';

class GetNavBar extends StatelessWidget {
  const GetNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: TextWidget("styledText"),);
  }
}
