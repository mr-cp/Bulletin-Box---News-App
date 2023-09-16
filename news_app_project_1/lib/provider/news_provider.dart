import 'package:flutter/widgets.dart';
import 'package:news_app_project_1/model/news_model.dart';
import 'package:news_app_project_1/services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newsList = [];

  List<NewsModel> get getNewsList => newsList;

  Future<List<NewsModel>> fetchNewsList({required int pageIndex,required String sortBy}) async {
    newsList = await NewsApiServices.getAllNews(page:pageIndex, sortBy: sortBy);
    return newsList;
  }
}
