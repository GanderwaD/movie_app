abstract class RouterObject {
  String get routeKey;
  String get routePath;
  bool get guard => false;
  onGoingBack() {}
}
