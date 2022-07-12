import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map_project/application/auth/sign_up/cubit/cubit.dart';
import 'package:road_map_project/infrastructure/local/manager.dart';
import 'package:road_map_project/infrastructure/remote/caegories/firebase_category_facade.dart';

import 'application/auth/login/cubit/cubit.dart';
import 'application/categories/categories_cubit.dart';
import 'application/news/cubit/cubit.dart';
import 'presentation/application_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalDatabaseManager.initialLocalDatabase();
  // FirebaseCategoriesFacade firebase = FirebaseCategoriesFacade();
  // firebase.uploadCategories();
  /// Here we initialize connection with our database

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AppLoginCubit(),
      ),
      BlocProvider(
        create: (_) => AppSignUpCubit(),
      ),
      BlocProvider(
        create: (context) => NewsCubit()..getNews(),
      ),
      BlocProvider(
        create: (context) => CategoriesCubit(FirebaseCategoriesFacade())..getCategories(),
      ),
    ],
    child: const ApplicationWidget(),
  ));
}
