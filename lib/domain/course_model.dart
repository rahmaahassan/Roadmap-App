import 'mentor_model.dart';
import 'step_model.dart';

class CourseModel {
  final String id;
  final String title;
  final String image;
  final String description;
  final MentorModel mentor;
  final List<StepModel> steps;

  CourseModel(
      {required this.id,
      required this.title,
      required this.image,
      required this.mentor,
      required this.description,
      required this.steps});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "id": id,
      "title": title,
      "image": image,
      "description": description,
      "mentor": mentor.toJson(),
      "steps":
          steps.map<Map<String, dynamic>>((step) => step.toJson()).toList(),
    };
    return data;
  }

  factory CourseModel.fromJson(Map<String, dynamic> data) {
    final String id = data['id'] ?? "";
    final String title = data['title'] ?? "";
    final String image = data['image'] ?? "";
    final String description = data['description'] ?? "";
    final MentorModel mentor = MentorModel.fromJson(data['mentor'] ?? {});
    final List<StepModel> steps = data['steps']
        .map<StepModel>((step) => StepModel.fromJson(step))
        .toList() as List<StepModel>;

    return CourseModel(
      id: id,
      title: title,
      image: image,
      description: description,
      mentor: mentor,
      steps: steps,
    );
  }
}
