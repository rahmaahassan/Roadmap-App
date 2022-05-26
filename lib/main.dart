import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:road_map_project/infrastructure/remote/caegories/firebase_category_facade.dart';

import 'presentation/application_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseCategoriesFacade firebase = FirebaseCategoriesFacade();
  // firebase.uploadCategories();
  /// Here we initialize connection with our database

  runApp(const ApplicationWidget());
}
