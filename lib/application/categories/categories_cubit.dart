import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map_project/domain/category_model.dart';

import '../../infrastructure/remote/caegories/firebase_category_facade.dart';
import 'categories_states.dart';


class CategoriesCubit extends Cubit<CategoriesStates> {
  final FirebaseCategoriesFacade _iCategoriesFacade;

  CategoriesCubit(this._iCategoriesFacade) : super(CategoriesInitialState());

  void getCategories() async{
    emit(CategoriesLoadingState());

    Either<String, List<CategoryModel>> failureOrSuccess = await _iCategoriesFacade.getAllCategories;

    failureOrSuccess.fold(
          (err) => emit(CategoriesFailureState(err)), // ifLeft callback
          (data) => emit(CategoriesSuccessState(data)), // ifRight callback
    );
  }

}