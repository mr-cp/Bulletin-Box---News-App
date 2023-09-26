import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app_project_1/consts/api_const.dart';
import 'package:news_app_project_1/consts/http_exceptions.dart';
import 'package:news_app_project_1/model/bookmark_model.dart';

import '../model/news_model.dart';

class NewsApiServices {
  //all news:

  static Future<List<NewsModel>> getAllNews(
      {required int page, required String sortBy}) async {
    // var url = Uri.parse(
    // "https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=a46c5b83efb34c7d905a0bb3d9c4b2b6");
    try {
      var uri = Uri.https(BASEURL, "v2/everything", {
        "q": "bitcoin",
        "pageSize": "4",
        "domains": "techcrunch.com",
        "page": page.toString(),
        "sortBy": sortBy,
        // "apiKey": API_KEY
      });

      var response = await http.get(uri, headers: {"X-Api-Key": API_KEY});
      // print('response status: ${response.statusCode}');
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        throw HttpException(data['code']);
      }

      for (var v in data['articles']) {
        newsTempList.add(v);
        // print(v.toString());
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }

  //top trending:

  static Future<List<NewsModel>> getTopTrending() async {
    try {
      var uri = Uri.https(BASEURL, "v2/top-headlines", {
        'country': 'us',
      });

      var response = await http.get(uri, headers: {"X-Api-Key": API_KEY});
      log('response status: ${response.statusCode}');
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        throw HttpException(data['code']);
      }

      for (var v in data['articles']) {
        newsTempList.add(v);
        // print(v.toString());
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }

// search news:

  static Future<List<NewsModel>> searchNews({required String query}) async {
    try {
      var uri = Uri.https(BASEURL, "v2/everything", {
        "q": query,
        "pageSize": "10",
        "domains": "techcrunch.com",
      });

      var response = await http.get(uri, headers: {"X-Api-Key": API_KEY});
      log('response status: ${response.statusCode}');
      Map data = jsonDecode(response.body);
      List newsTempList = [];

      if (data['code'] != null) {
        throw HttpException(data['code']);
      }

      for (var v in data['articles']) {
        newsTempList.add(v);
        // print(v.toString());
      }
      return NewsModel.newsFromSnapshot(newsTempList);
    } catch (error) {
      throw error.toString();
    }
  }

  //bookmark api methods:

  static Future<List<BookmarkModel>?> getBookmarks() async {
    try {
      var uri = Uri.https(BASEURL_FIREBASE, "collections.json");
      var response = await http.get(uri);

      log("${response.statusCode}");
      log(response.body);

      Map data = jsonDecode(response.body);
      List allKeys = [];

      if (data["code"] == null) {
        throw HttpException(data['code']);
      }

      for (String key in data.keys) { 
        allKeys.add(key);
      }
      log("$allKeys");

      return BookmarkModel.bookmarkFromSnapshot(json: data, allKeys: allKeys);
    } catch (error) {
      rethrow;
    }
  }
}
