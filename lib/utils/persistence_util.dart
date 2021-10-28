import 'package:SButler/utils/sp_util.dart';

class DataPersistenceUtil {
  static String _token = "tokenkey";
  static String getToken() => SpUtil.getString(_token); //获取token
  static Future<bool?> putToken(String token) =>
      SpUtil.putString(_token, token); //存储token
}
