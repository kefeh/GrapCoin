// HtmlElementView on flutter web requires a UI registry that's not available on
// android/ios. This suppresses that type error by loading a shim in non web
// contexts.
class FakePlatformViewRegistry {
  void registerViewFactory(
      String viewTypeId, dynamic Function(int) viewFactory) {
    throw UnsupportedError("platformViewRegistry called in non web context");
  }
}

final platformViewRegistry = FakePlatformViewRegistry();
