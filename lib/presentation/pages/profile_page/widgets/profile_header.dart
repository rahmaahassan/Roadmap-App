part of 'widgets.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 166.97.h,
      width: 414.w,
      decoration: BoxDecoration(
          color: ApplicationColor.navDisActiveBottom,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90.r))),
      child: Center(
          child: Image.asset(
        PresentationAssetPath.LOGO_IMAGE,
        color: ApplicationColor.primaryColor,
        height: 100.h,
      )),
    );
  }
}
