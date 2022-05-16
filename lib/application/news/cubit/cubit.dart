import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_map_project/domain/news_model.dart';

import '../../../infrastructure/dio_helper.dart';
import 'states.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  void getNews() async
  {
    emit(NewsLoadingState());

    List <NewsModel>? news = await DioHelper.getData();
    if (news != null) {
      emit(NewsSuccessState(news));
    } else {
      emit(NewsErrorState("error"));
    }
  }

}