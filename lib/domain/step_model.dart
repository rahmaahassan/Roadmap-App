import 'package:road_map_project/domain/link_model.dart';

class StepModel{
  final String name, id;
  final List<LinkModel> courses, books;

  StepModel({required this.name, required this.id, required this.courses, required this.books});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "id": id,
      "name": name,
      "courses": courses.map<Map<String, dynamic>>((course) => course.toJson()).toList(),
      "books": books.map<Map<String, dynamic>>((book) => book.toJson()).toList(),
    };
    return data;
  }

  factory StepModel.fromJson(Map<String, dynamic> data) {
    final String id = data['id'] ?? "";
    final String name = data['name'] ?? "";
    final List<LinkModel> courses = data['courses']?.map<LinkModel>(
            (course) => LinkModel.fromJson(course)).toList() ?? [];
    final List<LinkModel> books = data['books']?.map<LinkModel>(
            (book) => LinkModel.fromJson(book)
    ).toList() ?? [];

    return StepModel(
      id: id,
      name: name,
      courses: courses,
      books: books,
    );
  }
}