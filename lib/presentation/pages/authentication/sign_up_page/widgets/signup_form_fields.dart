part of 'widgets.dart';

class SignupFormFields extends StatefulWidget {
  const SignupFormFields({Key? key}) : super(key: key);

  @override
  State<SignupFormFields> createState() => _AuthFormFieldsState();
}

class _AuthFormFieldsState extends State<SignupFormFields> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var nameController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppSignUpCubit(),
      child: BlocConsumer<AppSignUpCubit, AppSignUpStates>(
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
                      controller: nameController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'please enter your name';
                        }
                        return null;
                      },
                      label: 'Name',
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
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
                      suffix: AppSignUpCubit.get(context).suffix,
                      isPassword: AppSignUpCubit.get(context).isPassword,
                      suffixPressed: () {
                        AppSignUpCubit.get(context).changePasswordVisibility();
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
                      onTap: onTappedSignUpWithGoogle,
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
                  ],
                ),
              ),
            );
          }),
    );
  }

  void onTappedSignUpWithGoogle() {
    /// TODO
  }

}
