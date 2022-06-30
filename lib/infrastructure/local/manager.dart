import 'package:shared_preferences/shared_preferences.dart';

part 'utils.dart';
part 'keys.dart';

class LocalDatabaseManager{

  static Future<void> initialLocalDatabase() async {

  }

  static Future<void> setIsFirstTime(bool val) async {
    await SharedPreferenceUtils.setBool(SharedPreferenceKeys.FIRST_TIME, val);
  }

  static Future<bool> getIsFirstTime() async {
    return await SharedPreferenceUtils.getBool(SharedPreferenceKeys.FIRST_TIME);
  }

}
