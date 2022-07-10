import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/presentation/helpers/presentation_helpers.dart';
import 'package:road_map_project/presentation/pages/shared_widgets/shared_widgets.dart';

import '../theme/colors.dart';
import '../theme/fonts.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite';

  const FavoritePage({Key? key}) : super(key: key);

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
      body: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () {},

          /// TODO
          child: Padding(
            padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 15.h),
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
                    imageUrl: PresentationAssetPath.LOGO_IMAGE,

                    /// TODO
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
                        border: Border.all(color: ApplicationColor.white),
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
                        border: Border.all(color: ApplicationColor.white),
                        color: PresentationHelperFunctions.generateRandomColor,
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Text(ApplicationTextValue.COURSE_NAME, /// TODO
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
                            child: Text(ApplicationTextValue.COURSE_NAME, /// TODO
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: ApplicationColor.white,
                                    fontWeight: ApplicationFont.medium)),
                          ),
                          Text(ApplicationTextValue.HEADER_TEXT, /// TODO
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
        separatorBuilder: (context, index) => SizedBox(
          height: 5.h,
        ),
        itemCount: 5,
      ),
    );
  }
}
