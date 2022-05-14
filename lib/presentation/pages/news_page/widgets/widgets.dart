import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/fonts.dart';
import '../../web_view/web_view.dart';

Widget myDivider() => Divider(
  thickness: 1,
  color: Colors.grey,
  indent: 25.w,
  endIndent: 25.w,
);

Widget buildArticleItem(article, context) => InkWell(
  onTap: () {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebView(article['url']))
    );
  },
  child: Padding(
    padding: EdgeInsets.all(20.0.r),
    child: Row(
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0.r),
            image: DecorationImage(
              image: NetworkImage('${article['urlToImage']}'),
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
                    '${article['title']}',
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
                  '${article['publishedAt']}',
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

Widget articleBuilder(list, context) {
  if (list.isEmpty) {
    return const Center(child: CircularProgressIndicator());
  }else {
    ListView.separated(
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10);
  }
  return null!;
}