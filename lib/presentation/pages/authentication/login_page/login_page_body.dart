part of 'widgets/widgets.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(children: [
              SizedBox(
                height: 20.5.h,
              ),
              Icon(
                Icons.person_outlined,
                color: ApplicationColor.authIconColor,
                size: 44.r,
              ),
              SizedBox(
                height: 18.h,
              ),
              Text(
                ApplicationTextValue.LOGIN_HEADER,
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
                height: 90.h,
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 42.h),
                    child: Container(
                      padding: EdgeInsets.only(left: 44.w),
                      height: 170.h,
                      width: double.infinity,
                      color: ApplicationColor.authScaffoldBackgroundColor,
                      child: Padding(
                        padding: EdgeInsets.only(top: 21.h),
                        child: InkWell(
                          onTap: onTappedForgotBottom,
                          child: Text(
                            ApplicationTextValue.FOGOT_PASSWORD,
                            style: TextStyle(
                                fontWeight: ApplicationFont.regular,
                                fontSize: 15.sp,
                                color: ApplicationColor.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 42.h, right: 26.w),
                      child: InkWell(
                        onTap: onTappedLoginBottom,
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
            ]);
          }),
    );
  }

  void onTappedForgotBottom() {
    /// TODO
  }

  void onTappedLoginBottom() {
    /// TODO
  }
}
