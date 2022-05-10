import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'presentation/application_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  /// Here we initialize connection with our database

  runApp(const ApplicationWidget());
}
