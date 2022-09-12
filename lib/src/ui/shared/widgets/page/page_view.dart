import 'package:flutter/material.dart';

import 'page_indicator.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({
    super.key,
    required this.items,
    this.shadowColor,
    this.radius = 0.0,
    this.border,
    this.boxHeight = 200.0,
    this.boxWidth = double.infinity,
    this.showPageIndicator = true,
    this.selectedColor,
    this.unselectedColor,
  });
  final List<Widget> items;
  final Color? shadowColor;
  final Color? selectedColor;
  final Color? unselectedColor;
  final double radius;
  final Border? border;
  final double boxHeight;
  final double boxWidth;
  final bool showPageIndicator;

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: widget.boxHeight,
            maxHeight: widget.boxHeight,
            maxWidth: widget.boxWidth,
            minWidth: widget.boxWidth,
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              border: widget.border,
              boxShadow: widget.shadowColor != null
                  ? [
                      BoxShadow(
                        color: widget.shadowColor!,
                        blurRadius: 15.0,
                        spreadRadius: 2.0,
                        offset: const Offset(
                          5.0,
                          7.0,
                        ),
                      )
                    ]
                  : null,
            ),
            child: PageView(
              onPageChanged: onPageChange,
              children: widget.items,
            ),
          ),
        ),
        if (widget.showPageIndicator)
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 5),
            child: PageIndicator(
              selectedColor: widget.selectedColor ?? Colors.black,
              unselectedColor: widget.unselectedColor ?? Colors.grey ,
              count: widget.items.length,
              currentIndex: currentIndex,
            ),
          ),
      ],
    );
  }

  ///on page view changed
  onPageChange(int pageIndex) {
    setCurrentIndex(pageIndex);
  }

  ///change page indicator index
  void setCurrentIndex(int pageIndex) {
    setState(() {
      currentIndex = pageIndex;
    });
  }
}
