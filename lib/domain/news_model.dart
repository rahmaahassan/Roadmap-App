class NewsModel {
  final String title, image, publishedAt, url;

  NewsModel(
      {required this.title, required this.image, required this.publishedAt, required this.url});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "title": title,
      "urlToImage": image,
      "publishedAt": publishedAt,
      "url": url,
    };
    return data;
  }

  factory NewsModel.fromJson(Map<String, dynamic> data) {
    final String title = data['title'] ?? "";
    final String image = data['urlToImage'] ?? "";
    final String publishedAt = data['publishedAt'] ?? "";
    final String url = data['url'] ?? "";

    return NewsModel(
      title: title,
      image: image,
      publishedAt: publishedAt,
      url: url,
    );
  }

}
