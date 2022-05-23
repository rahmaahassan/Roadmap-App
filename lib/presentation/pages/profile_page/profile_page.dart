import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/presentation/pages/authentication/auth_tab_bar.dart';
import 'package:road_map_project/presentation/theme/colors.dart';
import 'package:road_map_project/presentation/theme/fonts.dart';

import '../../helpers/presentation_helpers.dart';
import '../about_application_page/about_application_page.dart';
import 'widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ApplicationColor.navDisActiveBottom,
          elevation: 0,
          automaticallyImplyLeading:false,
        ),
        body: Column(
          children: [
            const ProfileHeader(),
            SizedBox(
              height: 123.h,
            ),
           const NotificationBottom(),
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
                    onPressed: () => onTappedAboutAppBottom(),
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

   void onTappedAboutAppBottom() {
     Navigator.pushNamed(context, AboutApplicationPage.routeName);
  }

  void onTappedLoginBottom() {
    Navigator.pushNamed(context, AuthTabBar.routeName);
  }
}
