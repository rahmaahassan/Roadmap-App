part of 'widgets.dart';

class LoginInFormFields extends StatefulWidget {
  const LoginInFormFields({Key? key}) : super(key: key);

  @override
  State<LoginInFormFields> createState() => _LoginInFormFieldsState();
}

class _LoginInFormFieldsState extends State<LoginInFormFields> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit, AppLoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(36.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'please enter your email address';
                        }
                        return null;
                      },
                      label: 'Email',
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      suffix: AppLoginCubit.get(context).suffix,
                      isPassword: AppLoginCubit.get(context).isPassword,
                      suffixPressed: () {
                        AppLoginCubit.get(context).changePasswordVisibility();
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'please enter your password';
                        }
                        return null;
                      },
                      label: 'Password',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: onTappedLoginWithGoogle,
                      child: Container(
                        height: 66.h,
                        width: 342.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: ApplicationColor.borderSignupColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.google,
                              color: ApplicationColor.white,
                            ),
                            SizedBox(
                              width: 14.h,
                            ),
                            const Text(
                              ApplicationTextValue.SIGNUP_WITH_GOOGLE,
                              style: TextStyle(color: ApplicationColor.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    InkWell(
                      onTap: onTappedLoginWithFacebook,
                      child: Container(
                        height: 66.h,
                        width: 342.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: ApplicationColor.borderSignupColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.facebookF,
                                color: ApplicationColor.white),
                            SizedBox(
                              width: 14.h,
                            ),
                            const Text(
                              ApplicationTextValue.SIGNUP_WITH_FACEBOOK,
                              style: TextStyle(color: ApplicationColor.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void onTappedLoginWithGoogle() {
    /// TODO
  }

  void onTappedLoginWithFacebook() {
    /// TODO
  }
}
