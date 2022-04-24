
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'fonts.dart';

class ApplicationTheme {

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: ApplicationColor.primaryColor,
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: ApplicationColor.primaryColor,
        ),
        scaffoldBackgroundColor: ApplicationColor.scaffoldBackgroundColor,
        fontFamily: ApplicationFont.dinNextFontFamily,
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.only(right: 56.06.w),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.w, color: ApplicationColor.white),
            insets: EdgeInsets.symmetric(horizontal: 48.w),
          ),

        )
    );
  }
}

