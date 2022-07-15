import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/domain/news_model.dart';

import '../../../helpers/presentation_helpers.dart';
import '../../../theme/colors.dart';
import '../../../theme/fonts.dart';
import '../../article_details_page/article_details_page.dart';

Widget myDivider() => Divider(
      thickness: 1,
      color: Colors.grey,
      indent: 25.w,
      endIndent: 25.w,
    );

Widget buildArticleItem(NewsModel article, context) => InkWell(
      onTap: () =>
          Navigator.pushNamed(context, ArticleDetails.routeName, arguments: {
        'article': article,
      }),
      child: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: Row(
          children: [
            Hero(
              tag: article.image,
              child: CachedNetworkImage(
                imageUrl: article.image.isEmpty ? "https://0.0.0.0/" : article.image,
                width: 120.w,
                height: 120.h,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: imageProvider,
                      //AssetImage(PresentationAssetPath.ACTIVITY_DEFAULT),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                    child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: const CircularProgressIndicator(),
                )),
                errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0.r),
                      border:
                          Border.all(color: ApplicationColor.white, width: 1.6),
                      color: ApplicationColor.navDisActiveBottom,
                      image: const DecorationImage(
                          image:
                              AssetImage(PresentationAssetPath.ARTICLE_DEFAULT),
                          fit: BoxFit.fill)),
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
      ),
    );

Widget articleBuilder(List<NewsModel> news, context) {
  return ListView.separated(
      itemBuilder: (context, index) => buildArticleItem(news[index], context),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: 10);
}
