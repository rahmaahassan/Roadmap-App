import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map_project/domain/category_model.dart';
import 'package:road_map_project/domain/course_model.dart';

import '../../infrastructure/local/manager.dart';
import '../../infrastructure/remote/caegories/firebase_category_facade.dart';
import 'categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  final FirebaseCategoriesFacade _iCategoriesFacade;

  CategoriesCubit(this._iCategoriesFacade) : super(CategoriesInitialState());

  void setIsFirstTime() async {
    LocalDatabaseManager.setIsFirstTime(true);
  }

  void getCategories() async {
    emit(CategoriesLoadingState());

    Either<String, List<CategoryModel>> failureOrSuccess =
        await _iCategoriesFacade.getAllCategories;

    failureOrSuccess.fold(
      (err) => emit(CategoriesFailureState(err)), // ifLeft callback
      (data) => emit(CategoriesSuccessState(data)), // ifRight callback
    );
  }

  Future<void> addCourseToFavorites(CourseModel course) async {
    LocalDatabaseManager.favoriteCourses.add(course);
    await LocalDatabaseManager.setFavoriteCourses(
        LocalDatabaseManager.favoriteCourses);
  }

  Future<void> removeCourseFromFavorites(String courseID) async {
    LocalDatabaseManager.favoriteCourses
        .removeWhere((course) => course.id == courseID);
    await LocalDatabaseManager.setFavoriteCourses(
        LocalDatabaseManager.favoriteCourses);
  }
}
