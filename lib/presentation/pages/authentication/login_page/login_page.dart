import 'package:flutter/material.dart';
import 'package:road_map_project/presentation/pages/authentication/login_page/widgets/widgets.dart';
import 'package:road_map_project/presentation/pages/authentication/sign_up_page/sign_up_page.dart';

import '../../../helpers/presentation_helpers.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login-page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: const TabBar(
            padding: EdgeInsets.only( bottom: 30),
            tabs: [
              Tab(text: ApplicationTextValue.LOGIN_TAB,),
              Tab(text: ApplicationTextValue.SIGNUP_TAB,)
            ],
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
