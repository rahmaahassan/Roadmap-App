import 'package:flutter/material.dart';

import '../notification_page/notification_page.dart';
import '../profile_page/profile_page.dart';
import '../search_page/search_page.dart';
import '../shared_widgets/navigation_bar_bottom/widgets.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late int currentIndex;

  List<Widget> screens = const [
    HomePageBody(),
    SearchPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  initState(){
    currentIndex = 0;
  }

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
