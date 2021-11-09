import 'package:SButler/common/config.dart';
import 'package:SButler/global/intl.dart';
import 'package:SButler/global/public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';

void main() {
  Config.init(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        GlobalSize.width,
        GlobalSize.height,
      ),
      builder: () => GetMaterialApp(
        //不显示右上角的debug图标
        debugShowCheckedModeBanner: false,
        //主题
        theme: ThemeData(
          primaryColor: GlobalColor.c30,
          brightness: Brightness.light,
        ),
        enableLog: true,
        translations: TranslationService(),
        fallbackLocale: TranslationService.fallbackLocale,
        locale: const Locale('zh', 'CN'),
        getPages: AppPages.routes,
        // initialRoute: _isLogin() ? AppRoutes.HOME : AppRoutes.LOGIN,
        initialRoute: _isLogin() ? AppRoutes.INDEX : AppRoutes.LOGIN,
      ),
    );
  }

//用户是否登录
  bool _isLogin() {
    return true;
  }
}
