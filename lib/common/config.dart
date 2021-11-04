import 'package:SButler/services/share_prefers.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/utils/http_util.dart';
import 'package:SButler/utils/sp_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Config {
  //初始化全局信息
  static Future init(Function() runApp) async {
    WidgetsFlutterBinding.ensureInitialized();
    // 初始化缓存
    // await SpUtil.init();
    await initService();
    HttpUtil.init();
    runApp();
    // 设置屏幕方向
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

initService() async {
  print('starting services ...');
  await Get.putAsync(() => SharePreferencesService().init());
  await Get.putAsync(() => UserInfoService().init());
  print('All services started...');
}
