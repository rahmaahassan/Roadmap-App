import 'package:flutter/material.dart';
import 'package:road_map_project/presentation/pages/authentication/auth_tab_bar.dart';
import 'package:road_map_project/presentation/pages/on_boarding/on_boarding_screen.dart';

import '../pages/navigation_bar_home/navigation_bar_home.dart';


class AppRouter {
  /// Here we type the initial page that appear after the splash screen.
  static const String initialRoute = AuthTabBar.routeName; // TODO

  static Map<String, WidgetBuilder> routes = {
    OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
    AuthTabBar.routeName: (context) => AuthTabBar(),
    NavigationBarHome.routeName: (context) => const NavigationBarHome(),
  };
}
