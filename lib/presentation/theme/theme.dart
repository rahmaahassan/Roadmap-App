
import 'package:flutter/material.dart';

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
    );
  }
}

