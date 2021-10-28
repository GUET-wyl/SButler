import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
//初始化本地存储
//prefs为1个SharedPreferences的实例对象，可以进行增删改查操作
  static SharedPreferences? _prefs;
  static SharedPreferences get prefs => _prefs!;
  SpUtil._();

  static Future<SharedPreferences> init() async {
    print("------------------init:${isInitialized()}");
    if (!isInitialized()) {
      _prefs = await SharedPreferences.getInstance();
      print("------------------init:$_prefs");
    }
    return _prefs!;
  }

  /// put object.
  static Future<bool?> putObject(String key, Object? value) async {
    if (_prefs == null) return null;
    return _prefs!.setString(key, value == null ? "" : json.encode(value));
  }

  /// get T.
  static T? parseObject<T>(String key, T f(Map v), {T? defValue}) {
    Map? map = getObject(key);
    return map == null ? defValue : f(map);
  }

  /// get object.
  static Map? getObject(String key) {
    if (_prefs == null) return null;
    String? _data = _prefs!.getString(key);
    return (_data == null || _data.isEmpty) ? null : json.decode(_data);
  }

  /// put object list.
  static Future<bool?> putObjectList(String key, List<Object>? list) async {
    if (_prefs == null || list == null) return null;
    List<String> data = list.map((value) => json.encode(value)).toList();
    return _prefs!.setStringList(key, data);
  }

  /// get T list.
  static List<T> parseObjectList<T>(String key, T f(Map v),
      {List<T> defValue = const []}) {
    List<Map>? data = getObjectList(key);
    List<T>? list = data?.map((value) => f(value)).toList();
    return list ?? defValue;
  }

  /// get object list.
  static List<Map>? getObjectList(String key) {
    if (_prefs == null) return null;
    List<String>? data = _prefs!.getStringList(key);
    return data?.map((value) {
      Map _dataMap = json.decode(value);
      return _dataMap;
    }).toList();
  }

  /// get string.
  static String getString(String key, {String defValue = ''}) {
    if (_prefs == null) return defValue;
    return _prefs!.getString(key) ?? defValue;
  }

  /// put string.
  static Future<bool?> putString(String key, String value) async {
    print('------------------put: $_prefs');
    if (_prefs == null) return null;
    return _prefs!.setString(key, value);
  }

  /// get bool.
  static bool getBool(String key, {bool defValue = false}) {
    if (_prefs == null) return defValue;
    return _prefs!.getBool(key) ?? defValue;
  }

  /// put bool.
  static Future<bool?> putBool(String key, bool value) async {
    if (_prefs == null) return null;
    return _prefs!.setBool(key, value);
  }

  /// get int.
  static int getInt(String key, {int defValue = 0}) {
    if (_prefs == null) return defValue;
    return _prefs!.getInt(key) ?? defValue;
  }

  /// put int.
  static Future<bool?> putInt(String key, int value) async {
    if (_prefs == null) return null;
    return _prefs!.setInt(key, value);
  }

  /// get double.
  static double getDouble(String key, {double defValue = 0.0}) {
    if (_prefs == null) return defValue;
    return _prefs!.getDouble(key) ?? defValue;
  }

  /// put double.
  static Future<bool?> putDouble(String key, double value) async {
    if (_prefs == null) return null;
    return _prefs!.setDouble(key, value);
  }

  /// get string list.
  static List<String> getStringList(String key,
      {List<String> defValue = const []}) {
    if (_prefs == null) return defValue;
    return _prefs!.getStringList(key) ?? defValue;
  }

  /// put string list.
  static Future<bool?> putStringList(String key, List<String> value) async {
    if (_prefs == null) return null;
    return _prefs!.setStringList(key, value);
  }

  /// get dynamic.
  static dynamic getDynamic(String key, {Object? defValue}) {
    if (_prefs == null) return defValue;
    return _prefs!.get(key) ?? defValue;
  }

  /// have key.
  static bool? haveKey(String key) {
    if (_prefs == null) return null;
    return _prefs!.getKeys().contains(key);
  }

  /// get keys.
  static Set<String>? getKeys() {
    if (_prefs == null) return null;
    return _prefs!.getKeys();
  }

  /// remove.
  static Future<bool?> remove(String key) async {
    if (_prefs == null) return null;
    return _prefs!.remove(key);
  }

  /// clear.
  static Future<bool?> clear() async {
    if (_prefs == null) return null;
    return _prefs!.clear();
  }

  ///Sp is initialized.
  static bool isInitialized() {
    return _prefs != null;
  }

//reload
  static Future<void> reload() async {
    if (_prefs == null) return;
    return _prefs!.reload();
  }
}
