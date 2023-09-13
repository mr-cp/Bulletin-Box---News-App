import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_project_1/consts/api_const.dart';

import '../model/news_model.dart';

class NewsApiServices {
  static Future<List<NewsModel>> getAllNews() async {
    // var url = Uri.parse(
    // "https://newsapi.org/v2/everything?q=bitcoin&pageSize=5&apiKey=a46c5b83efb34c7d905a0bb3d9c4b2b6");

    var uri = Uri.https(BASEURL, "v2/everything", {
      "q": "bitcoin",
      "pageSize": "5",
      "domains": "bbc.co.uk,techcrunch.com,engadget.com"

      // "apiKey": API_KEY
    });

    var response = await http.get(uri, headers: {"X-Api-Key": API_KEY});

    Map data = jsonDecode(response.body);
    List newsTempList = [];
    for (var v in data['articles']) {
      newsTempList.add(v);
      // print(v.toString());
    }
    return NewsModel.newsFromSnapshot(newsTempList);
  }
}
