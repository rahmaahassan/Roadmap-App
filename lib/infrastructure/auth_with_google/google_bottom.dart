part of '../../presentation/pages/authentication/sign_up_page/widgets/widgets.dart';

class GoogleBottom extends StatefulWidget {
  const GoogleBottom({Key? key}) : super(key: key);

  @override
  State<GoogleBottom> createState() => _GoogleBottomState();
}

class _GoogleBottomState extends State<GoogleBottom> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return  _isSigningIn
        ? const CircularProgressIndicator(
      valueColor:  AlwaysStoppedAnimation<Color>(Colors.white),
    )
        : InkWell(
      onTap: onTappedSignUpWithGoogle,
      child: Center(
        child: Container(
          height: 60.h,
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: ApplicationColor.borderLoginColor),
          child: const Center(
            child: FaIcon(
              FontAwesomeIcons.google,
              color: ApplicationColor.white,
            ),
          ),
        ),
      ),
    );
  }

  void onTappedSignUpWithGoogle() async {
    setState(() {
      _isSigningIn = true;
    });

    User? user =
    await AuthWithGoogle.signInWithGoogle(context: context);

    setState(() {
      _isSigningIn = false;
    });

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => UserInfoScreen(
            user: user,
          ),
        ),
      );    }
  }
}
