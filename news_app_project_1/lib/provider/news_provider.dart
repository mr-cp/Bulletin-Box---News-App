import 'package:flutter/widgets.dart';
import 'package:news_app_project_1/model/news_model.dart';
import 'package:news_app_project_1/services/news_api.dart';

class NewsProvider with ChangeNotifier {
  List<NewsModel> newsList = [];

  List<NewsModel> get getNewsList => newsList;

//all news:
  Future<List<NewsModel>> fetchNewsList(
      {required int pageIndex, required String sortBy}) async {
    newsList =
        await NewsApiServices.getAllNews(page: pageIndex, sortBy: sortBy);
    return newsList;
  }

  NewsModel findByDate({required String publishedAt}) {
    return newsList
        .firstWhere((newsModel) => newsModel.publishedAt == publishedAt);
  }

  //top trending:
  Future<List<NewsModel>> fetchTopHeadLine() async {
    newsList = await NewsApiServices.getTopTrending();
    return newsList;
  }

  //search news:
  Future<List<NewsModel>> fetchSearchNews({required String query}) async {
    newsList = await NewsApiServices.searchNews(query: query);
    return newsList;
  }
  
}
