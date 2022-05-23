part of 'widgets.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136.97.h,
      width: 414.w,
      decoration: BoxDecoration(
          color: ApplicationColor.navDisActiveBottom,
          borderRadius:
          BorderRadius.only(bottomLeft: Radius.circular(90.r))),
      child: Padding(
        padding: EdgeInsets.only(bottom: 58.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 44.w,
            ),
            ApplicationSVG.icon(
              icon: PresentationAssetPath.PROFILE_AVATAR,
              height: 70.h,
              width: 74.w,
            ),
            SizedBox(
              width: 12.w,
            ),
            Text(
              ApplicationTextValue.USER_NAME,
              style: TextStyle(
                  fontSize: 25.sp,
                  color: ApplicationColor.primaryColor,
                  fontWeight: ApplicationFont.bold),
            )
          ],
        ),
      ),
    );
  }
}
