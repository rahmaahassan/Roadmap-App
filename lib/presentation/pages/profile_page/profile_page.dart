import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/presentation/theme/colors.dart';
import 'package:road_map_project/presentation/theme/fonts.dart';

import '../../helpers/presentation_helpers.dart';
import '../../helpers/shared_widgets.dart';
import '../about_application_page/about_application_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  final bool _notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ApplicationColor.navDisActiveBottom,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
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
            ),
            SizedBox(
              height: 123.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 13.h),
              child: SwitchListTile(
                title: Text(
                  ApplicationTextValue.RECEVIED_NOTIFICATION,
                  style: TextStyle(
                      color: ApplicationColor.textSubTitleColor,
                      fontSize: 24.sp,
                      fontWeight: ApplicationFont.regular),
                ),
                value: _notificationsEnabled,
                onChanged: (bool value) {
                  // setState(() {
                  //   _notificationsEnabled = value;
                  // });
                },
                activeColor: ApplicationColor.authIconColor,
                secondary: const Icon(Icons.notifications_active_rounded,
                  color: ApplicationColor.textSubTitleColor,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.h),
              child: Row(
                children: [
                  const Icon(
                    Icons.perm_device_information,
                    color: ApplicationColor.textSubTitleColor,
                  ),
                  SizedBox(width: 25.w),
                  TextButton(
                    child: Text(
                      ApplicationTextValue.ABOUT_APP,
                      style: TextStyle(
                          color: ApplicationColor.textSubTitleColor,
                          fontSize: 24.sp,
                          fontWeight: ApplicationFont.regular),
                    ),
                    onPressed: () => onTappedAboutAppBottom(context),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.h),
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: ApplicationColor.textSubTitleColor,
                  ),
                  SizedBox(width: 25.w),
                  TextButton(
                    child: Text(
                      ApplicationTextValue.LOGIN,
                      style: TextStyle(
                          color: ApplicationColor.textSubTitleColor,
                          fontSize: 24.sp,
                          fontWeight: ApplicationFont.regular),
                    ),
                    onPressed: onTappedLoginBottom,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

   void onTappedAboutAppBottom(BuildContext context) {
     navigateTo(context, const AboutApplicationPage());
  }

  void onTappedLoginBottom() {
    /// TODO
  }
}
