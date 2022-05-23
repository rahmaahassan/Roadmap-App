
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';
import '../../pages/navigation_bar_home/navigation_bar_home.dart';
import 'widgets/widgets.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = '/on_boarding-page';

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            TextButton(
                onPressed: submit,
                child: Text(
                  'skip'.toUpperCase(),
                  style: TextStyle(
                      color: ApplicationColor.textSubTitleColor,
                      fontSize: 20.sp),
                ))
          ],
        ),
        body: const OnBoardingBody());
  }

  void submit() {
    Navigator.pushNamed(context, NavigationBarHome.routeName);
  }
}
