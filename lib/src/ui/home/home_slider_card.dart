/*
 * ---------------------------
 * File : landing_item_card.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';

import '../../models/home_slider_item.dart';
import '../widgets/card_widget.dart';
import '../widgets/text_widget/text_size.dart';
import '../widgets/text_widget/text_widget.dart';

class HomeSliderItemCard extends StatelessWidget {
  const HomeSliderItemCard({
    super.key,
    required this.item,
  });
  final HomeSliderItem item;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      fixedWidth: 20.0,
      child: Container(
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              item.title,
              fontWeight: FontWeight.bold,
              textSize: TextSize.uLarge,
            ),
            TextWidget(
              item.description,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
