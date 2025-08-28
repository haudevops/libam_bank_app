import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastCore {
  static final ToastCore _instance = ToastCore._internal();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory ToastCore() => _instance;

  ToastCore._internal();

  /// Khởi tạo 1 lần trong main.dart
  static void init() {
    // không cần gì thêm, chỉ giữ sẵn navigatorKey
  }

  /// Show toast mà không cần context
  static void show({
    required String message,
    ToastificationType type = ToastificationType.info,
    Duration duration = const Duration(seconds: 3),
    ToastificationStyle style = ToastificationStyle.fillColored,
    Alignment alignment = Alignment.topCenter,
  }) {
    final context = navigatorKey.currentContext;
    if (context == null) return;

    toastification.show(
      context: context,
      type: type,
      style: style,
      autoCloseDuration: duration,
      alignment: alignment,
      title: Text(message),
    );
  }
}
