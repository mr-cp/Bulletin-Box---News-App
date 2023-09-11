class NewsModel {
  String source,
      newsId,
      sourceName,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
      readingTimeText;

  NewsModel({
    required this.source,
    required this.newsId,
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.readingTimeText,
  });

  factory NewsModel.fromJson(dynamic json) {
    return NewsModel(
      source: json['source'] ?? "",
      newsId: json['source']['id'] ?? "",
      sourceName: json['source']['name'] ?? "",
      author: json['author'] ?? "",
      content: json['content'] ?? "",
      description: json['description'] ?? "",
      title: json['title'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      readingTimeText: json['readingTimeText'] ?? "",
    );
  }

  static List<NewsModel> newsFromSnapshot(List newSnapshot) {
    return newSnapshot.map((json) {
      return NewsModel.fromJson(json);
    }).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = newsId;
    data['id'] = sourceName;
    data['id'] = author;
    data['id'] = title;
    data['id'] = url;
    data['id'] = source;
    data['id'] = description;
    data['id'] = urlToImage;
    data['id'] = content;
    data['id'] = publishedAt;
    data['id'] = readingTimeText;

    return data;
  }
}
