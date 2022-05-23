part of 'widgets.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
