import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'helpers/presentation_helpers.dart';
import 'routes/router.dart';
import 'theme/theme.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ApplicationScreenSize.viewPortSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        title: ApplicationTextValue.APP_NAME,
        theme: ApplicationTheme.darkTheme,
        initialRoute: AppRouter.initialRoute,
        routes: AppRouter.routes,
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar"),
        ],
        locale: const Locale("ar"),
      ),
    );
  }
}
