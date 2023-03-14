import 'package:flutter/material.dart';

import '../image/asset_image.dart';
import '../text_widget/text_widget.dart';
import 'flat_button_widget.dart';

/*
 * ---------------------------
 * Project : Fan Support Mobile
 * File : drawer_button.dart
 * Status : created
 * ---------------------------
 * Author : nesmin
 * Date : Thu Jul 01 2021 2:37:58 PM
 * Copyright (c) 2021 
 * ---------------------------
 */

class DrawerButton extends StatelessWidget {
  final Widget? text;
  final String? iconPath;
  final VoidCallback? onPressed;
  final bool divider;
  final Widget? icon;
  final Widget? endingIcon;
  final String defaultText;

  const DrawerButton({
    Key? key,
    this.text,
    this.iconPath,
    this.onPressed,
    this.divider = false,
    this.icon,
    this.endingIcon,
    this.defaultText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FlatButtonWidget(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: SizedBox(
        height: 76.0,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Row(
                  children: [
                    Container(width: 20.0),
                    icon ??
                        Container(
                          width: 40.0,
                          height: 40.0,
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.cyan,
                          ),
                          child: Center(
                            child: AImage(
                              imgPath: iconPath!,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    Container(width: 16.0),
                    Expanded(
                      child: text ?? const TextWidget(''),
                    ),
                    endingIcon ?? const SizedBox.shrink(),
                    divider
                        ? const Icon(Icons.arrow_forward_ios,
                            size: 20.0, color: Colors.grey)
                        : const SizedBox.shrink(),
                    Container(width: 20.0),
                  ],
                ),
              ),
            ),
            Container(
                width: divider ? size.width : 0,
                height: 1.0,
                color: Colors.green),
          ],
        ),
      ),
    );
  }
}
