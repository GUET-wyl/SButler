import 'package:SButler/global/public.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//我的账户
// ignore: must_be_immutable
class MyAccountPage extends StatelessWidget {
  MyAccountPage({Key? key}) : super(key: key);
  final uS = Get.find<UserInfoService>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar3(
        onBack: () {
          Get.back();
        },
        txt: '我的账户',
        txt2: '明细',
        onClick: () {
          uS.getTaskDetailsApi();
        },
        mainContent: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 105.h,
                  bottom: 30.h,
                ),
                child: Image.asset(
                  'assets/images/coin.png',
                  fit: BoxFit.fill,
                  width: 304.w,
                  height: 241.w,
                ),
              ),
              Text(
                '我的账户',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'PingFang SC',
                  color: GlobalColor.c3f,
                ),
              ),
              Text(
                '${uS.loginInfo?.balance}',
                style: TextStyle(
                  fontSize: 58.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FandolHei',
                  color: GlobalColor.c3f,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
