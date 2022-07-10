part of 'widgets.dart';

class SignupFormFields extends StatefulWidget {
  const SignupFormFields({Key? key}) : super(key: key);

  @override
  State<SignupFormFields> createState() => _AuthFormFieldsState();
}

class _AuthFormFieldsState extends State<SignupFormFields> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppSignUpCubit(),
      child: BlocConsumer<AppSignUpCubit, AppSignUpStates>(
          listener: (context, state) {
            if (state is CreateUserSuccessState) {
              Navigator.pushNamed(context, NavigationBarHome.routeName);
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
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your name';
                          }
                          return null;
                        },
                        label: 'User Name',
                        prefix: Icons.person_outline),
                    SizedBox(
                      height: 25.h,
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
                        label: 'Email Address',
                        prefix: Icons.email_outlined),
                    SizedBox(
                      height: 25.h,
                    ),
                    defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        suffix: AppSignUpCubit.get(context).suffix,
                        isPassword:
                        AppSignUpCubit.get(context).isPassword,
                        suffixPressed: () {
                          AppSignUpCubit.get(context)
                              .changePasswordVisibility();
                        },
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'please enter your password';
                          }
                          return null;
                        },
                        label: 'Password',
                        prefix: Icons.lock_outline),
                    SizedBox(
                      height: 45.h,
                    ),
                    InkWell(
                      onTap: onTappedSignUpBottom,
                      child: Container(
                        height: 66.h,
                        width: 342.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: ApplicationColor.borderLoginColor),
                        child: const Center(
                          child: Text(
                            ApplicationTextValue.SIGNUP_BOTTOM,
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
                          return const Google_Bottom();
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

  void onTappedSignUpBottom() {
    if (formKey.currentState!.validate()) {
      AppSignUpCubit.get(context).userSignUp(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

}
