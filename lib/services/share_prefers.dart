// 本地存储service，实例化一个本地存储对象_prefs
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesService extends GetxService {
  late SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;
  //初始化_prefs
  Future<SharePreferencesService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }
}
