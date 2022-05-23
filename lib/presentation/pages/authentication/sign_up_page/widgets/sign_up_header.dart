part of 'widgets.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.5.h,
        ),
        ApplicationSVG.icon(
            color: ApplicationColor.authIconColor,
            width: 42.w,
            height: 42.h,
            icon: PresentationAssetPath.ADD_PERSON_ICON),
        SizedBox(
          height: 18.h,
        ),
        Text(
          ApplicationTextValue.SIGNUP_HEADER,
          style: TextStyle(
              fontSize: 28.sp,
              color: ApplicationColor.white,
              fontWeight: ApplicationFont.bold),
        ),
      ],
    );
  }
}
