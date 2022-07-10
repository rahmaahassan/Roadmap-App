import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/domain/course_model.dart';
import 'package:road_map_project/presentation/theme/fonts.dart';

import '../../theme/colors.dart';
import '../shared_widgets/shared_widgets.dart';
import 'widgets/widgets.dart';

class CourseDescriptionPage extends StatefulWidget {
  static const routeName = '/course-description-page';

  const CourseDescriptionPage({Key? key}) : super(key: key);

  @override
  State<CourseDescriptionPage> createState() => _CourseDescriptionPageState();
}

class _CourseDescriptionPageState extends State<CourseDescriptionPage> {
  late CourseModel course;

  @override
  Widget build(BuildContext context) {
    initializeArguments();
    return Scaffold(
      appBar: ApplicationAppBar(
        title: course.title,
        widget: Padding(
          padding: EdgeInsets.only(left: 13.w),
          child: const ApplicationBackButton(
            boxColor: ApplicationColor.navDisActiveBottom,
            arrowColor: ApplicationColor.primaryColor,
          ),
        ),
        widgets: [
          IconButton(
              onPressed: () {
                print(course.id);
              },
              icon: const Icon(Icons.star_border))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.description,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: ApplicationFont.regular,
                  color: ApplicationColor.textSubTitleColor,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TileList(steps: course.steps)
            ],
          ),
        ),
      ),
    );
  }

  void initializeArguments() {
    final arguments = ModalRoute.of(context)!.settings.arguments as CourseModel;
    course = arguments;
  }
}
