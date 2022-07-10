import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import 'widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ApplicationColor.authScaffoldBackgroundColor,
      child: Column(children: [
        const SignUpHeader(),
        SizedBox(
          height: 30.h,
        ),
        const SignupFormFields(),
      ]),
    );
  }
}
