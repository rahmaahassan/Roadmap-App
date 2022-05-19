import 'package:dartz/dartz.dart';

import '../../../domain/category_model.dart';

abstract class ICategoryFacade {
  Future<Either<String, List<CategoryModel>>>  get getAllCategories;

}