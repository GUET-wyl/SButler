import 'package:shared_preferences/shared_preferences.dart';

//初始化本地存储
//prefs为1个SharedPreferences的实例对象，可以进行增删改查操作
class StorageInfo {
  static SharedPreferences? prefs;
  static init() async {
    prefs ??= await SharedPreferences.getInstance();
  }
}
