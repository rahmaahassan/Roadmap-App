import 'package:road_map_project/domain/course_model.dart';

class CategoryModel {
  final String id, title;
  final List<CourseModel> courses;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.courses,
      });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "id": id,
      "title": title,
      "courses": courses.map<Map<String, dynamic>>((course) => course.toJson()).toList(),
    };

    return data;
  }

  factory CategoryModel.fromJson(Map<String, dynamic> data) {
    final String id = data['id'] as String;
    final String title = data['title'] as String;
    final List<CourseModel> courses = data['courses']
        .map<CourseModel>((step) => CourseModel.fromJson(step))
        .toList() as List<CourseModel>;

    return CategoryModel(
      id: id,
      title: title,
      courses: courses
    );
  }
}
