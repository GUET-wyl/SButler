import 'package:SButler/common/global/public.dart';
import 'package:SButler/common/widgets/bg_picture.dart';
import 'package:SButler/common/widgets/button.dart';
import 'package:SButler/common/widgets/top_appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  String _time = '320';
  @override
  Widget build(BuildContext context) {
    return BackPictureWidget2(
        content2: SelfAppbar2(
      mainContent: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Text.rich(
            TextSpan(
              text: '你已累计在星球学习',
              style: TextStyle(
                fontSize: 16.sp,
                color: GlobalColor.c3f,
                fontWeight: FontWeight.w500,
                fontFamily: 'PingFang SC',
              ),
              children: [
                TextSpan(
                  text: _time,
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: GlobalColor.c3f,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'FandolHei',
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('');
                    },
                ),
                TextSpan(
                  text: '分钟',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: GlobalColor.c3f,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PingFang SC',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60.h,
          ),
          Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/astronaut2.png',
                  fit: BoxFit.cover,
                  width: 279.w,
                  height: 433.w,
                ),
              ),
              Positioned(
                bottom: 40.h,
                left: 124.w,
                child: BtnWidget(
                  onClick: () {
                    Get.toNamed('/absorbed');
                  },
                  btnText: '开始学习',
                  btnWidth: 128.w,
                  btnHeight: 46.h,
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
