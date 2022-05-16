class NewsModel {
  final String title, image, publishedAt, articleDetails;

  NewsModel(
      {required this.title,
      required this.image,
      required this.publishedAt,
      required this.articleDetails});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "title": title,
      "urlToImage": image,
      "description": articleDetails,
      "publishedAt": publishedAt,
    };
    return data;
  }

  factory NewsModel.fromJson(Map<String, dynamic> data) {
    final String title = data['title'] ?? "";
    final String image = data['urlToImage'] ?? "";
    final String publishedAt = data['publishedAt'] ?? "";
    final String articleDetails = data['description'] ?? "";

    return NewsModel(
      title: title,
      image: image,
      publishedAt: publishedAt,
      articleDetails: articleDetails,
    );
  }
}
