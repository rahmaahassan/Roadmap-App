import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:road_map_project/presentation/pages/on_boarding/on_boarding_screen.dart';

import '../application/categories/categories_cubit.dart';
import '../application/categories/categories_states.dart';
import 'helpers/presentation_helpers.dart';
import 'pages/navigation_bar_home/navigation_bar_home.dart';
import 'pages/splash_page/splash_page.dart';
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
        builder: (_, __) => MaterialApp(
          title: ApplicationTextValue.APP_NAME,
          theme: ApplicationTheme.lightTheme,
          initialRoute: AppRouter.initialRoute,
          routes: AppRouter.routes,
          home: BlocBuilder<CategoriesCubit, CategoriesStates>(
              buildWhen: (oldState, newState) => oldState != newState,
              builder: (context, state) {
                print(state.toString());
                if (state is FirstOpened) {
                  return const OnBoardingScreen();
                } else if(state is AuthInitial){
                  return const SplashPage();
                }else{
                    return const NavigationBarHome();
                  }
              }),
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
    );
  }
}
