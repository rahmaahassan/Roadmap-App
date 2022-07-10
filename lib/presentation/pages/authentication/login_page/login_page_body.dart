part of 'widgets/widgets.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
              const LoginHeader(),
              SizedBox(
                height: 30.h,
              ),
              const LoginInFormFields(),
            ]);
  }

}
