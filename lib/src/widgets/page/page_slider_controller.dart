import 'page_slider.dart';

class PageSliderController {
  PageSliderState? _state;
  set state(PageSliderState state) => _state = state;

  nextPage([Duration? transitionDuration]) {
    if (_state != null && _state!.mounted) {
      _state!.nextPage(transitionDuration);
    }
  }

  previousPage([Duration? transitionDuration]) {
    if (_state != null && _state!.mounted) {
      _state!.previousPage(transitionDuration);
    }
  }

  setAutoSliderEnabled(bool isEnabled) {
    if (_state != null && _state!.mounted) {
      _state!.setAutoSliderEnabled(isEnabled);
    }
  }

  void jumpToPage(int page) {
    if (_state != null && _state!.mounted) {
      _state!.jumpToPage(page);
    }
  }
}
