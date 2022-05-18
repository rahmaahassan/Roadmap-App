import 'step_model.dart';

class CourseModel {
  final String id;
  final String title;
  final String image;
  final String categoryId;
  final String? description;
  final List<StepModel> steps;

  CourseModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.categoryId,
       this.description,
       required this.steps});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "id": id,
      "name": title,
      "image": image,
      "categoryId": categoryId,
      "description": description,
      "steps": steps.map<Map<String, dynamic>>((step) => step.toJson()).toList(),
    };
    return data;
  }

  factory CourseModel.fromJson(Map<String, dynamic> data) {
    final String id = data['id'] as String;
    final String title = data['title'] as String;
    final String image = data['image'] as String;
    final String categoryId = data['categoryId'] as String;
    final String description = data['description'] as String;
    final List<StepModel> steps = data['steps']
        .map<StepModel>((step) => StepModel.fromJson(step))
        .toList() as List<StepModel>;

    return CourseModel(
      id: id,
      title: title,
      image: image,
      categoryId: categoryId,
      description: description,
      steps: steps,
    );
  }
}
