import 'package:flutter/material.dart';
import 'package:flutter_loading_overlay/flutter_loading_overlay.dart';
import 'package:lottie/lottie.dart';

class AppLoading {
  static final FlutterLoadingOverlay _overlay = FlutterLoadingOverlay();

  static void init(GlobalKey<NavigatorState> navigatorKey) {
    _overlay.init(
      navigatorKey: navigatorKey,
      customChild: Lottie.asset(
        'assets/json/money_loading.json',
        width: 120,
        height: 120,
        fit: BoxFit.contain,
      ),
      color: Colors.black.withValues(alpha: 0.4),
    );
  }

  static void show() {
    startLoading;
  }

  static void hide() {
    stopLoading;
  }
}
