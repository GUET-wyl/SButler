import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/common/widgets/bg_picture.dart';
import 'common/global/public.dart';
import 'common/pages/home/home.dart';
import 'common/pages/index/index.dart';
import 'common/pages/login/login.dart';
import 'common/pages/register/register.dart';
import 'common/widgets/text_input.dart';
import 'common/widgets/top_appbar.dart';

void main() {
  runApp(const MyApp());
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
        //国际化
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   // ignore: prefer_const_constructors
        //   // Locale('zh','CN'),
        // ],
        // supportedLocales: const [
        //   Locale('zh', 'CN'),
        //   Locale('en', 'Us'),
        // ],
        //路由
        initialRoute: '/register',
        routes: {
          '/': (context) => const IndexPage(), //引导页
          '/home': (context) => const HomePage(), //首页
          '/login': (context) => const LoginPage(), //登录页
          '/register': (context) => RegisterPage(), //注册页
          '/up_photo': (context) => const UploadPhoto(), //上传头像
        },
        // home: LoginAndRegisterInputWidget(
        //   hintText: '密码',
        // ),
      ),
    );
  }
}

class LoginAndRegisterInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? node;
  final bool? obscureText;
  final String? hintText;
  const LoginAndRegisterInputWidget(
      {Key? key,
      this.controller,
      this.node,
      this.obscureText,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 281.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: GlobalColor.c1a,
            borderRadius: BorderRadius.circular(29.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 220.w,
                  height: 50.h,
                  child: TextField(
                    controller: controller,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: GlobalColor.c3f,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PingFang SC',
                    ),
                    decoration: InputDecoration(
                      isDense: false,
                      contentPadding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                      hintText: '密码',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: GlobalColor.c3f.withOpacity(.2),
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                    ),
                    obscureText: obscureText ?? false,
                    focusNode: node,
                    cursorColor: GlobalColor.c3f,
                  ),
                ),
                GestureDetector(
                  child: Image.asset(
                    'assets/open_eyes.png',
                    fit: BoxFit.fill,
                    width: 24.w,
                    height: 14.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
