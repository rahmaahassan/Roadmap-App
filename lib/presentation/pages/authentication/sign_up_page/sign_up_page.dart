
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/presentation_helpers.dart';
import '../../../theme/colors.dart';
import '../../../theme/fonts.dart';
import '../../shared_widgets/shared_widgets.dart';
import '../login_page/widgets/widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColor.authScaffoldBackgroundColor,
      body: Column(
          children: [
        SizedBox(
          height: 20.5.h,
        ),
        Icon(
          Icons.person_add_outlined,
          color: ApplicationColor.authIconColor,
          size: 42.r,
        ),
        SizedBox(
          height: 18.h,
        ),
        Text(
          ApplicationTextValue.SIGNUP_HEADER,
          style: TextStyle(
              fontSize: 28.sp,
              color: ApplicationColor.white,
              fontWeight: ApplicationFont.bold),
        ),
        SizedBox(
          height: 30.h,
        ),
        const LoginInFormFields(),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 190,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 42.h),
                child: Container(
                  padding: EdgeInsets.only(left: 44.w),
                  height: 170.h,
                  width: double.infinity,
                  color: ApplicationColor.primaryColor,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 42.h, right: 26.w),
                  child: InkWell(
                    onTap: onTappedBackBottom,
                    child: const ApplicationBackButton(
                      boxColor: ApplicationColor.authIconColor,
                      arrowColor: ApplicationColor.primaryColor,
                      showAuthIcon: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  void onTappedBackBottom(){
    /// TODO
    // if (formKey.currentState!.validate()) {
    //   AppLoginCubit.get(context).userLogin(
    //       email: emailController.text,
    //       password: passwordController.text);
    // }
  }
}
