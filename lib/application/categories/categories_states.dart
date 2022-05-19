
import 'package:road_map_project/domain/category_model.dart';

abstract class CategoriesStates{}

class CategoriesInitialState extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates {
   final List<CategoryModel> categories;

   CategoriesSuccessState(this.categories);
}

class CategoriesFailureState extends CategoriesStates {
  final String error;

  CategoriesFailureState(this.error);
}