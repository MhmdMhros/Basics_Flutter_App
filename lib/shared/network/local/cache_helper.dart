import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static late SharedPreferences sharedpreferences;
  static init() async{
    sharedpreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> PutBoolean({
    required String key,
    required bool value,
}) async{
    return await sharedpreferences.setBool(key, value);
  }
  static dynamic GetData({
    required String key,
  }){
    return sharedpreferences.get(key);
  }
  static Future<bool> SaveData({
    required String key,
    required dynamic value,
  }) async{
    if(value is String){
      return await sharedpreferences.setString(key, value);
    }
    if(value is int){
      return await sharedpreferences.setInt(key, value);
    }
    if(value is bool){
      return await sharedpreferences.setBool(key, value);
    }
    return await sharedpreferences.setDouble(key, value);

  }
  static Future<bool> ClearWithKey({
    required String key,
}) async{
    return await sharedpreferences.remove(key);
  }
}