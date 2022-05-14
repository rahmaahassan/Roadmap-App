import 'package:dio/dio.dart';

import '../domain/news_model.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future <List<NewsModel>?> getData() async
  {
    init();
    List<NewsModel> news = List.empty(growable: true);
    Response response = await dio!.get(
      'v2/top-headlines',
      queryParameters: {
        'country':'us',
        'category':'technology',
        'apiKey':'7f8dbc3bbd5047eaa5d169c1a8dbcb0e',
      },
    );
    if(response.statusCode == 200){
      Map<String, dynamic> data = response.data;
      news.addAll(data["articles"].map<NewsModel>((article) => NewsModel.fromJson(article)).toList());
      print(news[0].toString());

      return news;
    } else {
      return null;
    }
  }
}