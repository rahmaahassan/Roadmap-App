import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/presentation/theme/colors.dart';

import '../../helpers/presentation_helpers.dart';
import '../../theme/fonts.dart';
import '../shared_widgets/shared_widgets.dart';

class AboutApplicationPage extends StatelessWidget {
  static const routeName = '/about-application';

  const AboutApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBar(
        title: ApplicationTextValue.ABOUT_APPLICATION_APPBAR_TITLE,
        widget: Padding(
          padding: EdgeInsets.only(left: 13.w),
          child: const ApplicationBackButton(
            boxColor: ApplicationColor.navDisActiveBottom,
            arrowColor: ApplicationColor.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Text(
              ApplicationTextValue.ABOUT_APPLICATION_DESCRIPTION,
              style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: ApplicationFont.regular,
                  color: ApplicationColor.textSubTitleColor,
                  height: 1.6),
            ),
            SizedBox(
              height: 90.h,
            ),
            Center(
              child: Image.asset(PresentationAssetPath.LOGO_IMAGE,
                  width: 250.w, height: 150.h),
            ),
          ],
        ),
      ),
    );
  }
}
