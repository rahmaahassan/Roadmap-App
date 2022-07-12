import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/application/categories/categories_cubit.dart';
import 'package:road_map_project/application/categories/categories_states.dart';
import 'package:road_map_project/domain/category_model.dart';
import 'package:road_map_project/domain/course_model.dart';
import 'package:road_map_project/presentation/pages/search_page/widgets/widgets.dart';
import 'package:road_map_project/presentation/theme/colors.dart';
import 'package:road_map_project/presentation/theme/fonts.dart';

import '../course_description_page/course_description_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String searchString;

  @override
  void initState() {
    searchString = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CategoriesCubit, CategoriesStates>(
        builder: (context, state) {
      if (state is CategoriesSuccessState) {
        final List<CourseModel> courses = List.empty(growable: true);
        for (CategoryModel category in state.categories) {
          courses.addAll(category.courses);
        }
        List<Widget> searchData = List.empty(growable: true);
        for(CourseModel course in courses) {
          if (searchString.isNotEmpty &&
              course.title
                  .toLowerCase()
                  .contains(searchString.toLowerCase())
          ) {
            searchData.add(
                Padding(
                  padding: EdgeInsets.only(top: 20.r, right: 20.w, left: 20.w),
                  child: Container(
                      width: 369.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(
                              color: ApplicationColor.navDisActiveBottom)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 18.w),
                            child: Text(course.title,
                                style: TextStyle(
                                    color: ApplicationColor.textSubTitleColor,
                                    fontWeight: ApplicationFont.regular,
                                    fontSize: 23.sp)),
                          ),
                          InkWell(
                            onTap: () =>
                                Navigator.pushNamed(
                                    context, CourseDescriptionPage.routeName,
                                    arguments: {"course": course}),
                            customBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.r),
                              child: Container(
                                  width: 30.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.r),
                                    color: ApplicationColor.textSubTitleColor,
                                  ),
                                  child: Center(
                                      child: Icon(
                                        Icons.arrow_forward_rounded,
                                        color: ApplicationColor.primaryColor,
                                        size: 30.r,
                                      ))),
                            ),
                          )
                        ],
                      )),
                )
            );
          }
        }
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 45.h,
            ),
            child: Column(
              children: [
                SearchTextField(onChanged: onChanged),

              searchData.isNotEmpty || searchString.isEmpty? Center(child: Column(children: searchData))
                :  SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                  child: const Center(child: Text('This course is not available',  style: TextStyle(
                  color: ApplicationColor.textSubTitleColor,
              ),)),
                )
              ],
            ),
          ),
        );
      } else if (state is CategoriesFailureState) {
        return Center(
          child: Text(state.error),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }));
  }

  void onChanged(String value) {
    setState(() => searchString = value);
  }
}
