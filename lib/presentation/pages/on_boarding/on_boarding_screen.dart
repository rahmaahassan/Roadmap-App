
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';
import 'widgets/widgets.dart';

class OnBoardingScreen extends StatelessWidget {
  static const routeName = '/on_boarding-page';

  const OnBoardingScreen({Key? key}) : super(key: key);

  void submit() {} /// TODO

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
}
