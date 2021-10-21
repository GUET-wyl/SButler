import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/global/public.dart';
import 'common/pages/404/404.dart';
import 'common/pages/absorbed/absorbed.dart';
import 'common/pages/account_details/account_details.dart';
import 'common/pages/bad_net/bad_net.dart';
import 'common/pages/fail/fail.dart';
import 'common/pages/feedback/feedback.dart';
import 'common/pages/guide/guide.dart';
import 'common/pages/home/home.dart';
import 'common/pages/index/index.dart';
import 'common/pages/learn_record/learn_record.dart';
import 'common/pages/login/login.dart';
import 'common/pages/my_account/my_account.dart';
import 'common/pages/register/register.dart';
import 'common/pages/set/set.dart';
import 'common/pages/success/success.dart';
import 'common/pages/task/task.dart';
import 'common/pages/upload_photo/upload_photo.dart';
import 'common/pages/upload_photo2/upload_photo2.dart';

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
        initialRoute: '/home',
        routes: {
          '/': (context) => const GuidePage(), //引导页
          '/index': (context) => const IndexPage(), //主页
          '/home': (context) => HomePage(), //首页
          '/login': (context) => LoginPage(), //登录
          '/set': (context) => SetPage(), //设置
          '/feedback': (context) => FeedBackPage(), //意见反馈
          '/register': (context) => RegisterPage(), //注册
          '/up_photo': (context) => UploadPhoto(), //上传头像
          '/up_photo2': (context) => UploadPhoto2(), //上传头像2
          '/my_account': (context) => MyAccountPage(), //我的账户
          '/account_details': (context) => AccountDetails(), //账户明细
          '/404': (context) => NoConPage(), //无内容
          '/bad_net': (context) => const NoNetPage(), //无网
          '/success_results': (context) => const SuccessPage(), //专注成功
          '/fail_results': (context) => const FailPage(), //专注失败
          '/learn_records': (context) => RecordsPage(), //学习记录
          '/absorbed': (context) => AbsorbedPage(), //专注
          '/task': (context) => TaskPage(), //任务
        },
      ),
    );
  }
}
