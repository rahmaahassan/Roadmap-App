import 'package:flutter/material.dart';
import 'package:road_map_project/presentation/pages/authentication/auth_tab_bar.dart';
import 'package:road_map_project/presentation/pages/on_boarding/on_boarding_screen.dart';

import '../pages/about_application_page/about_application_page.dart';
import '../pages/article_details_page/article_details_page.dart';
import '../pages/authentication/reset_password/reset_password.dart';
import '../pages/course_description_page/course_description_page.dart';
import '../pages/navigation_bar_home/navigation_bar_home.dart';


class AppRouter {
  /// Here we type the initial page that appear after the splash screen.
  static const String initialRoute = NavigationBarHome.routeName; // TODO

  static Map<String, WidgetBuilder> routes = {
    OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
    AuthTabBar.routeName: (context) => AuthTabBar(),
    AboutApplicationPage.routeName: (context) => const AboutApplicationPage(),
    ResetPasswordPage.routeName: (context) => const ResetPasswordPage(),
    CourseDescriptionPage.routeName: (context) => const CourseDescriptionPage(),
    ArticleDetails.routeName: (context) => const ArticleDetails(),
    NavigationBarHome.routeName: (context) => const NavigationBarHome(),
  };
}
