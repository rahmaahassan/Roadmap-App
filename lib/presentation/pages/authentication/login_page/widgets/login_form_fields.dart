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
      child: BlocConsumer<AppLoginCubit, AppLoginStates>(
          listener: (context, state) {
            if (state is AppLoginErrorState) {
              showToast(
                text: state.error,
                state: ToastStates.ERROR,
              );
            }
            if(state is AppLoginSuccessState)
            {
              SharedPreferenceUtils.saveData(
                key: 'uId',
                value: state.uId,
              ).then((value)
              {
                Navigator.pushNamed(context, NavigationBarHome.routeName);
              });
            }
          },
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
                        prefix: Icons.email_outlined),
                    SizedBox(
                      height: 25.h,
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
                        prefix: Icons.lock_outline_rounded),
                    SizedBox(
                      height: 5.h,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () => onTappedForgotBottom(context),
                        child: Text(
                          ApplicationTextValue.FOGOT_PASSWORD,
                          style: TextStyle(
                            fontWeight: ApplicationFont.bold,
                            fontSize: 15.sp,
                            color: ApplicationColor.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    InkWell(
                      onTap: onTappedLoginBottom,
                      child: Container(
                        height: 66.h,
                        width: 342.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: ApplicationColor.borderLoginColor),
                        child: const Center(
                          child: Text(
                            ApplicationTextValue.LOGIN_TAB,
                            style: TextStyle(
                                color: ApplicationColor.white,
                                fontWeight: ApplicationFont.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Center(
                        child: Text(
                      ApplicationTextValue.OR_WITH_GOOGLE,
                      style: TextStyle(color: Colors.grey),
                    )),
                    SizedBox(
                      height: 20.h,
                    ),
                    FutureBuilder(
                      future: AuthWithGoogle.initializeFirebase(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Error initializing Firebase');
                        } else if (snapshot.connectionState == ConnectionState.done) {
                          return const GoogleBottom();
                        }
                        return const Center(
                          child:  CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.orange,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void onTappedForgotBottom(BuildContext context) {
    Navigator.pushNamed(context, ResetPasswordPage.routeName);
  }

  void onTappedLoginBottom() {
    if (formKey.currentState!.validate()) {
      AppLoginCubit.get(context).userLogin(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  void onTappedLoginWithGoogle() {
    /// TODO
  }

}


void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}