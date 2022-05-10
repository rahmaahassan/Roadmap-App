part of 'widgets.dart';

class ResetPasswordFormFields extends StatefulWidget {
  const ResetPasswordFormFields({Key? key}) : super(key: key);

  @override
  State<ResetPasswordFormFields> createState() => _ResetPasswordFormFieldsState();
}

class _ResetPasswordFormFieldsState extends State<ResetPasswordFormFields> {
  var formKey = GlobalKey<FormState>();

  var oldPasswordController = TextEditingController();

  var newPasswordController = TextEditingController();

  var repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
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
                      controller: oldPasswordController,
                      type: TextInputType.visiblePassword,suffix: ResetPasswordCubit.get(context).suffix,
                      isPassword: ResetPasswordCubit.get(context).isPassword,
                      suffixPressed: () {
                        ResetPasswordCubit.get(context).changePasswordVisibility();
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'please enter your old password';
                        }
                        return null;
                      },
                      label: 'Old Password',
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    defaultFormField(
                      controller: newPasswordController,
                      type: TextInputType.visiblePassword,
                      suffix: ResetPasswordCubit.get(context).suffix,
                      isPassword: ResetPasswordCubit.get(context).isPassword,
                      suffixPressed: () {
                        ResetPasswordCubit.get(context).changePasswordVisibility();
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'please enter your new password';
                        }
                        return null;
                      },
                      label: 'New Password',
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    defaultFormField(
                      controller: repeatPasswordController,
                      type: TextInputType.visiblePassword,
                      suffix: ResetPasswordCubit.get(context).suffix,
                      isPassword: ResetPasswordCubit.get(context).isPassword,
                      suffixPressed: () {
                        ResetPasswordCubit.get(context).changePasswordVisibility();
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'please enter the password again';
                        }
                        return null;
                      },
                      label: 'Repeat Password',
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

}
