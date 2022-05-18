class LinkModel {
  final String title, url;

  LinkModel({required this.title, required this.url});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "title": title,
      "url": url,
    };

    return data;
  }

  factory LinkModel.fromJson(Map<String, dynamic> data) {
    final String title = data['title'] as String;
    final String url = data['url'] as String;

    return LinkModel(
      title: title,
      url: url,
    );
  }
}