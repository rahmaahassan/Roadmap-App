import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/presentation/pages/authentication/login_page/widgets/widgets.dart';
import 'package:road_map_project/presentation/pages/authentication/sign_up_page/sign_up_page.dart';
import 'package:road_map_project/presentation/theme/colors.dart';

import '../../helpers/presentation_helpers.dart';

class AuthTabBar extends StatelessWidget {
  static const routeName = '/login-page';
  AuthTabBar({Key? key}) : super(key: key);

  final List<Tab> myTabs = <Tab>[
    const Tab(text: ApplicationTextValue.LOGIN_TAB,),
    const Tab(text: ApplicationTextValue.SIGNUP_TAB,)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(
            padding: EdgeInsets.only(bottom: 30.h),
            tabs: myTabs,
          ),
        ),
        body: const TabBarView(
          children: [
            LoginPageBody(),
            SignUpPage(),
          ],
        ),
      ),
    );
  }
}
