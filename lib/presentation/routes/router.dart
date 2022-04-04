import 'package:flutter/material.dart';
import 'package:road_map_project/presentation/pages/on_boarding/on_boarding_screen.dart';

import '../pages/home_page/home_page.dart';


class AppRouter {
  /// Here we type the initial page that appear after the splash screen.
  static const String initialRoute = HomePage.routeName; // TODO

  static Map<String, WidgetBuilder> routes = {
    OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
    HomePage.routeName: (context) => const HomePage(),
  };
}
