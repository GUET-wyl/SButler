import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NoNetPage extends StatelessWidget {
  const NoNetPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar4(
        onBack: () {
          Get.back();
        },
        txt: '账户明细',
        mainContent: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 98.h,
                  bottom: 24.h,
                ),
                child: Image.asset(
                  'assets/images/nonet.png',
                  fit: BoxFit.fill,
                  width: 192.w,
                  height: 213.w,
                ),
              ),
              Text(
                '你的网络不给力哦',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'PingFang SC',
                  color: GlobalColor.cfa,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
