import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late  final SharedPreferences prefs ;
   static Future<void> init()async{
    prefs = await SharedPreferences.getInstance();
  }
  static Future<void> setValues({required String key,required value})async{

    if(value is int){
      await prefs.setInt(key, value);
    }else if(value is double){
      await prefs.setDouble(key, value);
    }else if(value is bool){
      await prefs.setBool(key, value);
    }else if(value is String){
      await prefs.setString(key, value);
    }else{
      await prefs.setStringList(key, value);
    }
  }
  static bool getBool({required String key}){
    return prefs.getBool(key)!;
  }
}