/*
 * ---------------------------
 * File : dropdown_widget.dart
 * ---------------------------
 * Author : Nesrullah Ekinci (nesmin)
 * Email : dev.nesmin@gmail.com
 * ---------------------------
 */

import 'package:flutter/material.dart';

import '../text_widget/text_size.dart';
import '../text_widget/text_widget.dart';
import 'dropdown_item.dart';

typedef MenuItemLeading = Widget Function(DropDownItem item);

class DropDownWidget extends StatelessWidget {
  final List<DropDownItem> items; //must have id section and name section
  final int? value;
  final double? menuMaxHeight;
  final double? dropDownButtonHeight;
  final Widget? title;
  final Function(Object?)? onChanged;
  final bool isSelected;

  final Color? textColor;
  final Color? backgroundColor;
  final Color? selectedColor;
  final EdgeInsets? containerPadding;
  final Decoration? containerDecoration;
  final String? hintText;
  final MenuItemLeading? menuItemLeading;
  final Widget? menuItemEnding;
  final Widget? hintWidget;
  final Color itemTextColor;
  final Color textHintColor;
  final Color dropDownBackGroundColor;
  final Color iconColor;

  const DropDownWidget({
    Key? key,
    required this.items,
    this.value,
    this.menuMaxHeight,
    this.dropDownButtonHeight,
    this.title,
    this.onChanged,
    this.isSelected = false,
    this.textColor,
    this.backgroundColor,
    this.selectedColor,
    this.containerPadding,
    this.containerDecoration,
    this.hintText,
    this.menuItemLeading,
    this.menuItemEnding,
    this.hintWidget,
    this.itemTextColor = Colors.black,
    this.textHintColor = Colors.grey,
    this.dropDownBackGroundColor = Colors.white,
    this.iconColor =Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title ?? const SizedBox.shrink(),
        Container(
          height: dropDownButtonHeight,
          padding:
              containerPadding ?? const EdgeInsets.symmetric(vertical: 4.0),
          decoration: containerDecoration ??
              BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: itemTextColor, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
          child: Center(
            child: DropdownButton(
              hint: hintWidget ??
                  (hintText != null
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextWidget(
                            hintText ?? '',
                            color: textHintColor,
                            textSize: TextSize.medium,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      : null),
              isExpanded: true,
              onChanged: onChanged,
              value: value,
              dropdownColor: dropDownBackGroundColor,
              underline: const SizedBox.shrink(),
              menuMaxHeight: menuMaxHeight,
              icon: Icon(Icons.arrow_drop_down,
                  size: 36.0, color: iconColor),
              items: List.generate(items.length, (int index) {
                return DropdownMenuItem(
                  value: items[index].did,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      if (menuItemLeading != null)
                        menuItemLeading!(items[index]),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: TextWidget(
                            items[index].dName,
                            maxLines: 1,
                            textSize: value == items[index].did
                                ? TextSize.large
                                : TextSize.medium,
                            fontWeight: value == items[index].did
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: itemTextColor,
                          ),
                        ),
                      ),
                      if (menuItemEnding != null) menuItemEnding!,
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
