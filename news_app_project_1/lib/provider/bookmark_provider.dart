import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_project_1/consts/api_const.dart';
import 'package:news_app_project_1/model/bookmark_model.dart';
import 'package:news_app_project_1/model/news_model.dart';

import '../services/news_api.dart';

class BookmarkProvider with ChangeNotifier {
  List<BookmarkModel> bookmarkList = [];
  List<BookmarkModel> get getBookmarkList => bookmarkList;

//get method

  Future<List<BookmarkModel>> fetchBookmark() async {
    bookmarkList = await NewsApiServices.getBookmarks() ?? [];
    return bookmarkList;
  }

//post method:

  Future<void> addToBookmark({required NewsModel newsModel}) async {
    try {
      var uri = Uri.https(BASEURL_FIREBASE, "collectionsBookmark.json");
      var response = await http.post(
        uri,
        body: json.encode(
          newsModel.toJson(),
        ),
      );
      // print("${response.statusCode}");
      // print(response.body);
    } catch (error) {
      rethrow;
    }
  }

//delete method:
  Future<void> deleteBookmark() async {
    try {
      var uri = Uri.https(
          BASEURL_FIREBASE, "collectionsBookmark/-Nexk5W0Z1XtgWjetaWc.json");
      var response = await http.delete(uri);
      print("${response.statusCode}");
      print(response.body);
    } catch (error) {
      rethrow;
    }
  }
}
