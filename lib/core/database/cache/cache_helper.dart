// import 'package:shared_preferences/shared_preferences.dart';
//
// class CacheHelper {
//   static SharedPreferences? _preferences;
//
//   static Future<void> init() async {
//     _preferences = await SharedPreferences.getInstance();
//   }
//
//   static Future<void> saveOnBoardingSeen() async {
//     await _preferences?.setBool('onBoardingSeen', true);
//   }
//
//   static bool hasSeenOnBoarding() {
//     return _preferences?.getBool('onBoardingSeen') ?? false;
//   }
// }
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // حفظ بيانات من أي نوع
  static Future<void> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      await _preferences?.setBool(key, value);
    } else if (value is int) {
      await _preferences?.setInt(key, value);
    } else if (value is double) {
      await _preferences?.setDouble(key, value);
    } else if (value is String) {
      await _preferences?.setString(key, value);
    }
  }

  // استرجاع البيانات
  static dynamic getData({required String key}) {
    return _preferences?.get(key);
  }

  // دالة إضافية: حذف بيانات
  static Future<void> removeData({required String key}) async {
    await _preferences?.remove(key);
  }

  // دوالك السابقة لا تزال موجودة
  static Future<void> saveOnBoardingSeen() async {
    await _preferences?.setBool('onBoardingSeen', true);
  }

  static bool hasSeenOnBoarding() {
    return _preferences?.getBool('onBoardingSeen') ?? false;
  }
}

