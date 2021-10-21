import 'package:SButler/common/global/public.dart';
import 'package:SButler/common/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
