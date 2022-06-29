import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/splash-page';

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColor.primaryColor,
      body: Image.asset(
        "assets/images/splash.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
