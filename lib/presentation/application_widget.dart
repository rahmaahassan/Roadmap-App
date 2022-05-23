import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/application/categories/categories_cubit.dart';

import '../application/auth/login/cubit/cubit.dart';
import '../application/news/cubit/cubit.dart';
import '../infrastructure/remote/caegories/firebase_category_facade.dart';
import 'helpers/presentation_helpers.dart';
import 'routes/router.dart';
import 'theme/theme.dart';

class ApplicationWidget extends StatelessWidget {
  const ApplicationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppLoginCubit(),
        ),
        BlocProvider(
          create: (context) => NewsCubit()..getNews(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(FirebaseCategoriesFacade())..getCategories(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: ApplicationScreenSize.viewPortSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => MaterialApp(
          title: ApplicationTextValue.APP_NAME,
          theme: ApplicationTheme.lightTheme,
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
            Locale("en"),
          ],
          locale: const Locale("en"),
        ),
      ),
    );
  }
}
