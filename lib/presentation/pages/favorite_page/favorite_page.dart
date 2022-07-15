import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/infrastructure/local/manager.dart';
import 'package:road_map_project/presentation/helpers/presentation_helpers.dart';
import 'package:road_map_project/presentation/pages/shared_widgets/shared_widgets.dart';

import '../../theme/colors.dart';
import '../../theme/fonts.dart';
import '../course_description_page/course_description_page.dart';


class FavoritePage extends StatefulWidget {
  static const routeName = '/favorite';

  FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ApplicationAppBar(
          title: ApplicationTextValue.FAVORITE_TITLE,
          widget: Padding(
            padding: EdgeInsets.only(left: 13.w),
            child: const ApplicationBackButton(
              boxColor: ApplicationColor.navDisActiveBottom,
              arrowColor: ApplicationColor.primaryColor,
            ),
          ),
        ),
        body: LocalDatabaseManager.favoriteCourses.isNotEmpty
            ? ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 15.h),
                  child: GestureDetector(
                    onTap: () async {
                      // Navigator.pushNamed(
                      //     context, CourseDescriptionPage.routeName,
                      //     arguments:
                      //     {
                      //     "course": LocalDatabaseManager.favoriteCourses[index],
                      //     "callBack": ( ) => callBack(),
                      //     }
                      // );
                      await Navigator.push(context, MaterialPageRoute(builder: (_)=> CourseDescriptionPage(
                        course: LocalDatabaseManager.favoriteCourses[index],
                      )));

                      setState((){});
                    },
                    child: Container(
                      height: 74.h,
                      width: 396.w,
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ApplicationColor.buttonBorderColor,
                      ),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            height: 70.h,
                            width: 70.w,
                            imageUrl: LocalDatabaseManager
                                .favoriteCourses[index].image.isEmpty ? "https://0.0.0.0/" : LocalDatabaseManager
                                .favoriteCourses[index].image,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  //AssetImage(PresentationAssetPath.ACTIVITY_DEFAULT),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: ApplicationColor.white),
                                color: ApplicationColor.primaryColor,
                              ),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.all(10.h),
                                child: const CircularProgressIndicator(
                                  strokeWidth: 3.0,
                                ),
                              )),
                            ),
                            errorWidget: (context, url, error) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: ApplicationColor.white),
                                color: PresentationHelperFunctions
                                    .generateRandomColor,
                              ),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                      LocalDatabaseManager
                                          .favoriteCourses[index].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ApplicationColor.white,
                                          fontWeight: ApplicationFont.regular,
                                          fontSize: 15.sp)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Expanded(
                            child: SizedBox(
                              //height: 121.h,
                              width: 315.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    child: Text(
                                        LocalDatabaseManager
                                            .favoriteCourses[index].title,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: ApplicationColor.white,
                                            fontWeight:
                                                ApplicationFont.medium)),
                                  ),
                                  Text(
                                      LocalDatabaseManager
                                          .favoriteCourses[index].description,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: ApplicationColor.white,
                                          fontWeight: ApplicationFont.regular))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: LocalDatabaseManager.favoriteCourses.length,
              )
            : const Center(
                child: Text(
                  'There is no favorite courses',
                  style: TextStyle(color: ApplicationColor.white),
                ),
              ));
  }

}
