/*
 * ---------------------------
 * File : landing_item_card.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';

import '../../models/landing_item.dart';
import '../widgets/card_widget.dart';
import '../widgets/text_widget/text_size.dart';
import '../widgets/text_widget/text_widget.dart';

class LandingItemCard extends StatelessWidget {
  const LandingItemCard({
    super.key,
    required this.item,
  });
  final LandingItem item;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
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
