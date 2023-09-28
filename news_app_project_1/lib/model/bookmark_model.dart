import 'package:flutter/material.dart';

class BookmarkModel with ChangeNotifier {
  String bookmarkKey,
      newsId,
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
      {required this.bookmarkKey,
      required this.newsId,
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

  factory BookmarkModel.fromJson(
      {required dynamic json, required bookmarkKey}) {
    return BookmarkModel(
      bookmarkKey: bookmarkKey,
      newsId: json["newsid"] ?? "",
      sourceName: json["source"]["name"] ?? "",
      author: json["author"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ??
          "https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1",
      publishedAt: json["publishedAt"] ?? "",
      dateToShow: json["pubdateToShowlishedAt"] ?? "",
      content: json["content"] ?? "",
      readingTimeText: json["readingTimeText"] ?? "",
    );
  }

  static List<BookmarkModel> 
  bookmarkFromSnapshot(
      {required dynamic json, required List allKeys}) {
    return allKeys.map((key) {
      // print('process key:$key');
      var bookmark = BookmarkModel.fromJson(json: json[key], bookmarkKey: key);
      // print('bookmark created:$bookmark');
    return bookmark;
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


// import 'package:flutter/cupertino.dart';

// class BookmarkModel with ChangeNotifier {
//   String bookmarkKey,
//       newsId,
//       sourceName,
//       authorName,
//       title,
//       description,
//       url,
//       urlToImage,
//       publishedAt,
//       dateToShow,
//       content,
//       readingTimeText;

//   BookmarkModel({
//     required this.bookmarkKey,
//     required this.newsId,
//     required this.sourceName,
//     required this.authorName,
//     required this.title,
//     required this.description,
//     required this.url,
//     required this.urlToImage,
//     required this.publishedAt,
//     required this.content,
//     required this.dateToShow,
//     required this.readingTimeText,
//   });

//   factory BookmarkModel.fromJson(
//       {required dynamic json, required bookmarkKey}) {
//     return BookmarkModel(
//       bookmarkKey: bookmarkKey,
//       newsId: json['newsId'] ?? "",
//       sourceName: json['sourceName'] ?? "",
//       authorName: json['authorName'] ?? "",
//       title: json['title'] ?? "",
//       description: json['description'] ?? "",
//       url: json['url'] ?? '',
//       urlToImage: json['urlToImage'] ??
//           'https://cdn-icons-png.flaticon.com/512/833/833268.png',
//       publishedAt: json['publishedAt'] ?? '',
//       dateToShow: json['dateToShow'] ?? "",
//       content: json['content'] ?? "",
//       readingTimeText: json['readingTimeText'] ?? "",
//     );
//   }

//   static List<BookmarkModel> bookmarksFromSnapshot(
//       {required dynamic json, required List allKeys}) {
//     return allKeys.map((key) {
//       return BookmarkModel.fromJson(json: json[allKeys], bookmarkKey: key);
//     }).toList();
//   }

//   @override
//   String toString() {
//     return 'news {newsId: $newsId, sourceName: $sourceName, authorName: $authorName, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content,}';
//   }
// }