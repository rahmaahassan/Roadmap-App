import 'package:flutter/material.dart';

import '../pages/home_page/home_page.dart';


class AppRouter {
  /// Here we type the initial page that appear after the splash screen.
  static const String initialRoute = HomePage.routeName; // TODO

  static Map<String, WidgetBuilder> routes = {
    // StartPage.routeName: (context) => const StartPage(),
    HomePage.routeName: (context) => const HomePage(),
  };
}
