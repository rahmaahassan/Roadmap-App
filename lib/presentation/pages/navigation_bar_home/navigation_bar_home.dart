import 'package:flutter/material.dart';
import 'package:road_map_project/presentation/pages/news_page/news_page.dart';

import '../profile_page/profile_page.dart';
import '../shared_widgets/navigation_bar_bottom/widgets.dart';
import '../home_page/widgets/widgets.dart';

class NavigationBarHome extends StatefulWidget {
  static const routeName = '/home-page';
  const NavigationBarHome({Key? key}) : super(key: key);

  @override
  State<NavigationBarHome> createState() => _NavigationBarHomeState();
}

class _NavigationBarHomeState extends State<NavigationBarHome> {

  late int currentIndex;

  List<Widget> screens = const [
    HomePage(),
    NewsPage(),
    ProfilePage(),
  ];

  @override
  initState() => currentIndex = 0;

  void changeBottomNav(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: AppBottomNavigationBar(onSelect: changeBottomNav, index: currentIndex)
    );
  }
}
