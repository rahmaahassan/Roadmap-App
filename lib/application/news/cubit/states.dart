import '../../../domain/news_model.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsSuccessState extends NewsStates {
  List<NewsModel> news;

  NewsSuccessState(this.news);
}

class NewsErrorState extends NewsStates {
  final String error;

  NewsErrorState(this.error);
}