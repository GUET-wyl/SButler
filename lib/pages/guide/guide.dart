import 'dart:async';

import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/bg_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//引导页
class GuidePage extends StatefulWidget {
  GuidePage({Key? key}) : super(key: key);

  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  late Timer timer;
  var currentTimer = 3;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentTimer == 0) {
        //停止计时，去专注成功页面
        timer.cancel();
        Get.toNamed('/index');
        return;
      }
      currentTimer--;
      //每间隔1秒回调一下
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackPictureWidget(
      content: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 116.h,
            left: 282.w,
            child: Image.asset(
              'assets/images/moon.png',
              width: 25.w,
              height: 25.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 65.h,
          ),
          Center(
            child: Image.asset(
              'assets/images/astronaut.png',
              width: 344.w,
              height: 293.w,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 629.h,
            left: 42.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '你只管努力',
                  style: TextStyle(
                    color: GlobalColor.c3f,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PingFang SC',
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Text(
                  '剩下的交给时间',
                  style: TextStyle(
                    color: GlobalColor.c3f,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PingFang SC',
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
