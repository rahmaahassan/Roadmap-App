import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/domain/course_model.dart';
import 'package:road_map_project/infrastructure/local/manager.dart';
import 'package:road_map_project/presentation/theme/fonts.dart';

import '../../../application/categories/categories_cubit.dart';
import '../../theme/colors.dart';
import '../shared_widgets/shared_widgets.dart';
import 'widgets/widgets.dart';

class CourseDescriptionPage extends StatefulWidget {
  static const routeName = '/course-description-page';
  CourseModel? course;
  Function? callBack;

   CourseDescriptionPage({Key? key, this.callBack, this.course}) : super(key: key);

  @override
  State<CourseDescriptionPage> createState() => _CourseDescriptionPageState();
}

class _CourseDescriptionPageState extends State<CourseDescriptionPage> {
  late CourseModel course;
  Function? callBack;

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
              onPressed: () async {
                if(LocalDatabaseManager.favoriteCourses
                    .any((element) => element.id == course.id)) {
                 await context.read<CategoriesCubit>().removeCourseFromFavorites(course.id);
                } else {
                  await context.read<CategoriesCubit>().addCourseToFavorites(course);
                }
                setState((){
                  widget.callBack;
                });
              },
              icon: LocalDatabaseManager.favoriteCourses
                      .any((element) => element.id == course.id)
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border))
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
    final arguments = ModalRoute.of(context)!.settings.arguments as Map?;

    if(arguments == null){
      course = widget.course!;
      return;
    }
    course = arguments["course"];
  }
}
