import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../application/auth/sign_up/cubit/cubit.dart';
import '../../../../application/auth/sign_up/cubit/states.dart';
import '../../../helpers/presentation_helpers.dart';
import '../../../theme/colors.dart';
import '../../shared_widgets/shared_widgets.dart';
import '../widgets/widgets.dart';
import 'widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppSignUpCubit(),
        child: BlocConsumer<AppSignUpCubit, AppSignUpStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return ColoredBox(
                color: ApplicationColor.authScaffoldBackgroundColor,
                child: Column(children: [
                  const SignUpHeader(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Form(
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
                              prefix: Icons.person_outline),
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
                              prefix: Icons.email_outlined),
                          SizedBox(
                            height: 26.h,
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
                                    style: TextStyle(
                                        color: ApplicationColor.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 42.h),
                        child: Container(
                          padding: EdgeInsets.only(left: 44.w),
                          height: 130.h,
                          width: double.infinity,
                          color: ApplicationColor.primaryColor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 42.h, right: 26.w),
                          child: state is! AppSignUpLoadingState ? InkWell(
                            onTap:
                              onTappedSignUpBottom,
                            child: const ApplicationBackButton(
                              boxColor: ApplicationColor.authIconColor,
                              arrowColor: ApplicationColor.primaryColor,
                              showAuthIcon: true,
                            ),
                          ) : const Center(child: CircularProgressIndicator(),),
                        ),
                      ),
                    ],
                  )
                ]),
              );
            }));
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

  void onTappedSignUpWithGoogle() {
    /// TODO
  }
}
