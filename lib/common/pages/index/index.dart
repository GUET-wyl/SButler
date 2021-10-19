import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learn/common/global/public.dart';
import 'package:learn/common/widgets/bg_picture.dart';
import 'package:learn/common/widgets/button.dart';
import 'package:learn/common/widgets/top_appbar.dart';

//引导页
class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackPictureWidget(
      content: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 72.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 282.w,
              ),
              child: Image.asset(
                'assets/moon.png',
                width: 25.w,
                height: 25.w,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 65.h,
            ),
            Center(
              child: Image.asset(
                'assets/astronaut.png',
                width: 344.w,
                height: 293.w,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 42.w,
                top: 130.h,
                right: 200.w,
              ),
              child: Text(
                '纵使面对浩瀚星球',
                style: TextStyle(
                  color: GlobalColor.c3f,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'PingFang SC',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 42.w,
                top: 9.h,
                right: 189.w,
              ),
              child: Text(
                '你的目标都只有一个',
                style: TextStyle(
                  color: GlobalColor.c3f,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'PingFang SC',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//主页
class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalColor.c30,
        body: Column(
          children: [
            SizedBox(
              height: 72.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 282.w,
              ),
              child: Image.asset(
                'assets/moon.png',
                width: 25.w,
                height: 25.w,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            Center(
              child: Image.asset(
                'assets/astronaut.png',
                width: 344.w,
                height: 293.w,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 63.h,
            ),
            Column(
              children: [
                BtnWidget(
                  btnText: '登录',
                  onClick: () {
                    Get.toNamed('/login');
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                Btn2Widget(
                  text: '注册',
                  onClick: () {
                    Get.toNamed('/register');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}