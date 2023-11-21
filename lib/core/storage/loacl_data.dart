import 'package:hive_flutter/adapters.dart';

class AppLocal {
  static String Image_Key = 'Image_Key';
  static String Name_Key = 'Name_Key';
  static String IS_UPLOAD = 'IS_UPLOAD';

  static cacheData(String key, dynamic value) async {
    var box = Hive.box('user');
    await box.put(key, value);
  }

  static Future<dynamic> getData(
    String key,
  ) async {
    var box = Hive.box('user');
    return await box.get(key);
  }

  static deleteData(
    String key,
  ) async {
    var box = Hive.box('user');
    await box.delete(key);
  }
}
// import 'package:shared_preferences/shared_preferences.dart';

// class AppLocal {
//   static String imageKey = 'Image_Key';
//   static String nameKey = 'Name_Key';
//   static String isUpload = 'isUpload';

//   static cacheData(String key, String data) async {
//     var prefs = await SharedPreferences.getInstance();
//     prefs.setString(key, data);
//   }

//   static Future<String> getChached(String key) async {
//     var prefs = await SharedPreferences.getInstance();
//     return prefs.getString(key) ?? '';
//   }

//   static cacheBool(String key, bool data) async {
//     var prefs = await SharedPreferences.getInstance();
//     prefs.setBool(key, data);
//   }

//   static Future<bool> getBool(String key) async {
//     var prefs = await SharedPreferences.getInstance();
//     return prefs.getBool(key) ?? false;
//   }
// }
