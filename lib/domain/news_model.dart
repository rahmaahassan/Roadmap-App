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
    final String title = data['title'] as String;
    final String image = data['urlToImage'] as String;
    final String publishedAt = data['publishedAt'] as String;
    final String url = data['url'] as String;

    return NewsModel(
      title: title,
      image: image,
      publishedAt: publishedAt,
      url: url,
    );
  }

}
