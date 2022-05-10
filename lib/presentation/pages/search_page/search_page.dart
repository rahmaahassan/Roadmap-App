import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/presentation/pages/search_page/widgets/widgets.dart';
import 'package:road_map_project/presentation/theme/colors.dart';
import 'package:road_map_project/presentation/theme/fonts.dart';

import '../../helpers/presentation_helpers.dart';
import '../shared_widgets/shared_widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const SearchTextField(),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(15.r),
                  child: Container(
                      width: 369.w,
                      height: 64.h,
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
                            child: Text(ApplicationTextValue.SEARCH_ITEM,
                                style: TextStyle(
                                    color: ApplicationColor.textSubTitleColor,
                                    fontWeight: ApplicationFont.regular,
                                    fontSize: 23.sp)),
                          ),
                          Padding(
                            padding: EdgeInsets.all(14.r),
                            child: const ApplicationBackButton(
                              arrowColor: ApplicationColor.primaryColor,
                              boxColor: ApplicationColor.textSubTitleColor,
                              showAuthIcon: true,
                            ),
                          )
                        ],
                      )),
                ),
            itemCount: 4));
  }
}
