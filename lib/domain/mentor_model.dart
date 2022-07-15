class MentorModel {
  final String name, url;

  MentorModel({required this.name, required this.url});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "name": name,
      "url": url,
    };

    return data;
  }

  factory MentorModel.fromJson(Map<String, dynamic> data) {
    final String name = data['name'] ?? "";
    final String url = data['url'] ?? "";

    return MentorModel(
      name: name,
      url: url,
    );
  }
}