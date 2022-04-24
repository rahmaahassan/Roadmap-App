import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/presentation/theme/colors.dart';
import 'package:road_map_project/presentation/theme/fonts.dart';

import '../../helpers/presentation_helpers.dart';
import '../shared_widgets/shared_widgets.dart';

class NotificationPage extends StatelessWidget {
  static const routeName = '/notification-page';

  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.5.w),
          child: const ApplicationBackButton(
            boxColor: ApplicationColor.navDisActiveBottom,
            arrowColor: ApplicationColor.primaryColor,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ApplicationSVG.image(
                image: PresentationAssetPath.NOTIFICATION_IMAGE),
            SizedBox(
              height: 23.h,
            ),
            Text(
              ApplicationTextValue.NOTIFICATION_TITLE,
              style: TextStyle(
                  fontSize: 30.sp,
                  color: ApplicationColor.white,
                  fontWeight: ApplicationFont.regular),
            )
          ],
        ),
      ),
    );
  }
}
