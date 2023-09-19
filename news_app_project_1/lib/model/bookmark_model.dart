import 'package:flutter/material.dart';
import 'package:reading_time/reading_time.dart';

import '../services/global_method.dart';

class BookmarkModel with ChangeNotifier {
  String newsId,
      sourceName,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      dateToShow,
      content,
      readingTimeText;

  BookmarkModel(
      {required this.newsId,
      required this.sourceName,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.dateToShow,
      required this.content,
      required this.readingTimeText});

  factory BookmarkModel.fromJson(dynamic json) {
    String title = json["title"] ?? "";
    String description = json["description"] ?? "";
    String content = json["content"] ?? "";
    String dateToShow = "";
    if (json["publishedAt"] != null) {
      dateToShow = GlobalMethod.formattedDateText(json["publishedAt"]);
    }
    return BookmarkModel(
      newsId: json["newsid"] ?? "",
      sourceName: json["source"]["name"] ?? "",
      author: json["author"] ?? "",
      title: title,
      description: description,
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ??
          "https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1",
      publishedAt: json["publishedAt"],
      dateToShow: dateToShow,
      content: content,
      readingTimeText: readingTime(title + description + content).msg,
    );
  }

  static List<BookmarkModel> newsFromSnapshot(List newSnapshot) {
    return newSnapshot.map((json) {
      return BookmarkModel.fromJson(json);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["NewsId"] = newsId;
    data["sourceName"] = sourceName;
    data["author"] = author;
    data["title"] = title;
    data["description"] = description;
    data["url"] = url;
    data["urlToImage"] = urlToImage;
    data["publishedAt"] = publishedAt;
    data["dateToShow"] = dateToShow;
    data["content"] = content;
    data["readingTimeText"] = readingTimeText;
    return data;
  }

  @override
  String toString() {
    return 'news{newsId:$newsId, sourceName:$sourceName, author:$author, title:$title, description:$description, url:$url, urlToImage:$urlToImage, publishedAt:$publishedAt, dateToShow:$dateToShow, content:$content, readingTimeText:$readingTimeText}';
  }
}
