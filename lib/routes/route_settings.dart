import 'package:flutter/material.dart';
import 'package:libam_bank_app/routes/slide_left_route.dart';

import 'screen_arguments.dart';
import 'package:libam_bank_app/pages/pages.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    late ScreenArguments arg;
    final Object? arguments = settings.arguments;
    if (arguments != null) {
      arg = arguments as ScreenArguments;
    }
    switch (settings.name) {
      case LoginView.routeName:
        return SlideLeftRoute(const LoginView());
      case HomeView.routeName:
        return SlideLeftRoute(const HomeView());
      default:
        throw ('this route name does not exist');
    }
  }
}