/*
 * ---------------------------
 * File : carousel_slider.dart
 * ---------------------------
 * Author : Eren Tatar (ganderwa)
 * Email : dev.ganderwa@gmail.com
 * ---------------------------
 */

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../animations/slide_transform/default_transform.dart';
import '../animations/slide_transform/slide_transform.dart';
import 'page_slider_controller.dart';

const _kMaxValue = 200000000000;
const _kMiddleValue = 10;

typedef PageSliderBuilder = Widget Function(int index);

class PageSlider extends StatefulWidget {
  const PageSlider({
    Key? key,
    required this.pageBuilder,
    required this.itemCount,
    this.infiniteScroll = false,
    this.scrollDirection = Axis.horizontal,
    this.slideTransform = const DefaultTransform(),
    this.enableAutoSlider = false,
    this.initialPage = 0,
    this.controller,
    this.viewportFraction = 1,
    this.autoSliderTransitionCurve = Curves.easeOutQuad,
    this.autoSliderTransitionTime = const Duration(seconds: 1),
    this.autoSliderDelay = const Duration(seconds: 5),
    this.boxHeight = 200,
    this.boxWidth = double.infinity,
    this.radius,
    this.border,
    this.shadowColor,
    this.clipBehavior = Clip.hardEdge,
    this.onPageChanged,
  })  : children = null,
        super(key: key);

  final PageSliderBuilder? pageBuilder;
  final List<Widget>? children;
  final SlideTransform slideTransform;
  final int itemCount;
  final bool infiniteScroll;
  final Axis scrollDirection;
  final bool enableAutoSlider;
  final int initialPage;
  final PageSliderController? controller;
  final double viewportFraction;
  final Duration autoSliderTransitionTime;
  final Curve autoSliderTransitionCurve;
  final Duration autoSliderDelay;
  final double boxHeight;
  final double boxWidth;
  final double? radius;
  final Border? border;
  final Color? shadowColor;
  final Clip clipBehavior;
  final Function(int index)? onPageChanged;

  @override
  State<PageSlider> createState() => PageSliderState();
}

class PageSliderState extends State<PageSlider> {
  PageController? _pageController;
  int? _currentPage;
  int realPage = 10000;
  int currentIndex = 0;
  double _pageDelta = 0;
  Timer? _timer;
  late bool _isPlaying;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: widget.boxHeight,
        maxHeight: widget.boxHeight,
        maxWidth: widget.boxWidth,
        minWidth: widget.boxWidth,
      ),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius ?? (0.0)),
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
        child: PageView.builder(
          clipBehavior: widget.clipBehavior,
          onPageChanged: (index) {
            widget.onPageChanged!(index % widget.itemCount);
          },
          scrollBehavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
              overscroll: false,
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
          itemCount: widget.infiniteScroll ? _kMaxValue : widget.itemCount,
          controller: _pageController,
          scrollDirection: widget.scrollDirection,
          itemBuilder: (context, index) {
            final slideIndex = index % widget.itemCount;
            Widget slide = widget.children == null
                ? widget.pageBuilder!(slideIndex)
                : widget.children![slideIndex];
            return widget.slideTransform.transform(context, slide, index,
                _currentPage, _pageDelta, widget.itemCount);
          },
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant PageSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enableAutoSlider != widget.enableAutoSlider) {
      setAutoSliderEnabled(widget.enableAutoSlider);
    }
    if (oldWidget.itemCount != widget.itemCount) {
      _initPageController();
    }
    _initCarouselSliderController();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _pageController?.dispose();
  }

  @override
  void initState() {
    super.initState();
    _isPlaying = widget.enableAutoSlider;
    _currentPage = widget.initialPage;
    _initCarouselSliderController();
    _initPageController();
    setAutoSliderEnabled(_isPlaying);
  }

  void _initCarouselSliderController() {
    if (widget.controller != null) {
      widget.controller!.state = this;
    }
  }

  void _initPageController() {
    _pageController?.dispose();
    _pageController = PageController(
      viewportFraction: widget.viewportFraction,
      keepPage: true,
      initialPage: widget.infiniteScroll
          ? _kMiddleValue * widget.itemCount + _currentPage!
          : _currentPage!,
    );
    _pageController!.addListener(() {
      setState(() {
        _currentPage = _pageController!.page!.floor();
        _pageDelta = _pageController!.page! - _pageController!.page!.floor();
      });
    });
  }

  void nextPage(Duration? transitionDuration) {
    _pageController!.nextPage(
      duration: transitionDuration ?? widget.autoSliderTransitionTime,
      curve: widget.autoSliderTransitionCurve,
    );
  }

  void previousPage(Duration? transitionDuration) {
    _pageController!.previousPage(
      duration: transitionDuration ?? widget.autoSliderTransitionTime,
      curve: widget.autoSliderTransitionCurve,
    );
  }

  void jumpToPage(int page) {
    _pageController!.jumpToPage(page);
  }

  void setAutoSliderEnabled(bool isEnabled) {
    if (_timer != null) {
      _timer!.cancel();
    }
    if (isEnabled) {
      _timer = Timer.periodic(widget.autoSliderDelay, (timer) {
        _pageController!.nextPage(
          duration: widget.autoSliderTransitionTime,
          curve: widget.autoSliderTransitionCurve,
        );
      });
    }
  }
}
