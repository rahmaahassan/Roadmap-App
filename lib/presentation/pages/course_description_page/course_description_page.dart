import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/presentation_helpers.dart';
import '../../theme/colors.dart';
import '../shared_widgets/shared_widgets.dart';

class CourseDescriptionPage extends StatelessWidget {
  static const routeName = '/course-description-page';

  const CourseDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationAppBar(
          title: ApplicationTextValue.COURSE_NAME,
          widget: Padding(
            padding: EdgeInsets.only(left: 13.w),
            child: const ApplicationBackButton(
              boxColor: ApplicationColor.navDisActiveBottom,
              arrowColor: ApplicationColor.primaryColor,
            ),
          ),
      ),

    );
  }
}
