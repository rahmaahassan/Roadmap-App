import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/course_model.dart';

part 'utils.dart';

part 'keys.dart';

class LocalDatabaseManager {
  static List<CourseModel> favoriteCourses = [];
  static bool notificationBottomValue = false;

  static Future<void> initialLocalDatabase() async {
    favoriteCourses = await getFavoriteCourses();
    notificationBottomValue = await getNotificationBottomValue();
    // SharedPreferenceUtils.clearData();
  }

  static Future<void> setIsFirstTime(bool val) async {
    await SharedPreferenceUtils.setBool(SharedPreferenceKeys.FIRST_TIME, val);
  }

  static Future<bool> getIsFirstTime() async {
    return await SharedPreferenceUtils.getBool(SharedPreferenceKeys.FIRST_TIME);
  }

  static Future<void> setNotificationBottomValue(bool val) async {
    notificationBottomValue = val;
    await SharedPreferenceUtils.setBool(
        SharedPreferenceKeys.NOTIFICATION_BOTTOM_KEY, val);
  }

  static Future<bool> getNotificationBottomValue() async {
    return await SharedPreferenceUtils.getBool(
        SharedPreferenceKeys.NOTIFICATION_BOTTOM_KEY);
  }

  static Future<void> setFavoriteCourses(
      List<CourseModel> favoritesCourses) async {
    favoriteCourses = favoritesCourses;
    String encodedList =
        json.encode(favoritesCourses.map((course) => course.toJson()).toList());
    await SharedPreferenceUtils.setString(
        SharedPreferenceKeys.FAVORITES_COURSES_KEY, encodedList);
  }

  static Future<List<CourseModel>> getFavoriteCourses() async {
    String x = await SharedPreferenceUtils.getString(
        SharedPreferenceKeys.FAVORITES_COURSES_KEY);
    if (x.isEmpty) {
      return [];
    }

    List<dynamic> decodedList = json.decode(x) as List<dynamic>;

    List<CourseModel> favoriteCourses = List.empty(growable: true);
    favoriteCourses.addAll(decodedList
        .map<CourseModel>((course) => CourseModel.fromJson(course))
        .toList());

    return favoriteCourses;
  }
}
