import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/domain/news_model.dart';

import '../../../theme/colors.dart';
import '../../../theme/fonts.dart';

Widget myDivider() => Divider(
  thickness: 1,
  color: Colors.grey,
  indent: 25.w,
  endIndent: 25.w,
);

Widget buildArticleItem(NewsModel article, context) => Padding(
  padding: EdgeInsets.all(20.0.r),
  child: Row(
    children: [
      Container(
        width: 120.w,
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          image: DecorationImage(
            image: NetworkImage(article.image),
            fit: BoxFit.fill,
          ),
        ),
      ),
      SizedBox(
        width: 20.0.w,
      ),
      Expanded(
        child: SizedBox(
          height: 120.0.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  article.title,
                  style: TextStyle(
                      color: ApplicationColor.textTitleColor,
                      fontWeight: ApplicationFont.bold,
                      fontSize: 15.sp),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                article.publishedAt,
                style: TextStyle(
                    color: ApplicationColor.searchBorderColor,
                    fontWeight: ApplicationFont.regular,
                    fontSize: 10.sp),
              )
            ],
          ),
        ),
      )
    ],
  ),
);

Widget articleBuilder(List<NewsModel> news , context) {
    return ListView.separated(
        itemBuilder: (context, index) => buildArticleItem(news[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10);
}