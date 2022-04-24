part of 'widgets.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({Key? key}) : super(key: key);

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {

  @override
  Widget build(BuildContext context) {
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
                            onTap: onTappedBackBottom,
                            child: const ApplicationBackButton(
                              boxColor: ApplicationColor.navDisActiveBottom,
                              arrowColor: ApplicationColor.primaryColor,
                              showAuthIcon: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]);
  }

  void onTappedForgotBottom(){
    /// TODO
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
