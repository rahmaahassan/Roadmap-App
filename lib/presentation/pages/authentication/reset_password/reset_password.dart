import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/presentation_helpers.dart';
import '../../../theme/colors.dart';
import '../../../theme/fonts.dart';
import '../../shared_widgets/shared_widgets.dart';
import 'widgets/widgets.dart';

class ResetPasswordPage extends StatelessWidget {
  static const routeName = '/reset-password';

  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        SizedBox(
          height: 18.h,
        ),
        Text(
          ApplicationTextValue.RESET_PASSWORD_HEADER,
          style: TextStyle(
              fontSize: 28.sp,
              color: ApplicationColor.white,
              fontWeight: ApplicationFont.bold),
        ),
        SizedBox(
          height: 30.h,
        ),
        const ResetPasswordFormFields(),
        SizedBox(
          height: 100.h,
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 42.h),
              child: Container(
                padding: EdgeInsets.only(left: 44.w),
                height: 170.h,
                width: double.infinity,
                color: ApplicationColor.backArrowColor,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 42.h, right: 26.w),
                child: InkWell(
                  onTap: onTappedResetPasswordBottom,
                  child: const ApplicationBackButton(
                    boxColor: ApplicationColor.navDisActiveBottom,
                    arrowColor: ApplicationColor.primaryColor,
                    showAuthIcon: true,
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  void onTappedResetPasswordBottom() {
    /// TODO
  }
}
