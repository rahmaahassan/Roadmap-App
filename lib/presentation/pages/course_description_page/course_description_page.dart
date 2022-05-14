import 'package:flutter/material.dart';

import '../../helpers/presentation_helpers.dart';
import '../shared_widgets/shared_widgets.dart';

class CourseDescriptionPage extends StatelessWidget {
  const CourseDescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ApplicationAppBar(
        title: ApplicationTextValue.COURSE_NAME,
      ),

    );
  }
}
