import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/dio_helper.dart';
import 'states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(GetSearchLoadingState());

    // DioHelper.getData(
    //   url: 'v2/everything',
    //   query:
    //   {
    //     'q':'$value',
    //     'apiKey':'65f7f556ec76449fa7dc7c0069f040ca',
    //   },
    // ).then((value)
    // {
    //   //print(value.data['articles'][0]['title']);
    //   search = value.data['articles'];
    //   print(search[0]['title']);
    //
    //   emit(GetSearchSuccessState());
    // }).catchError((error){
    //   print(error.toString());
    //   emit(GetSearchErrorState(error.toString()));
    // });
  }

}