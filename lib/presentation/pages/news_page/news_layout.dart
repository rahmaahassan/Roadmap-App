import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/presentation/theme/colors.dart';
import 'package:road_map_project/presentation/theme/fonts.dart';

import '../../helpers/presentation_helpers.dart';
import '../shared_widgets/shared_widgets.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationAppBar(
        title: ApplicationTextValue.NEWS_TITLE,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildArticleItem(),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 25.w,
            endIndent: 25.w,
              ),
          itemCount: 10),
    );
  }

  Widget buildArticleItem() => InkWell(
        // onTap: () {
        //   navigateTo(context, WebView(article['url']));
        // },
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Row(
            children: [
              Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0.r),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://media.istockphoto.com/photos/breaking-news-world-news-with-map-backgorund-picture-id1182477852?k=20&m=1182477852&s=612x612&w=0&h=I3wdSzT_5h1y9dHq_YpZ9AqdIKg8epthr8Guva8FkPA='),
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
                          'Title',
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
                        'publishedAt',
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
}
