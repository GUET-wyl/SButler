import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FailPage extends StatelessWidget {
  const FailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalColor.c30,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 101.h,
                  bottom: 102.h,
                ),
                child: Text(
                  '很遗憾，专注失败',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PingFang SC',
                    color: GlobalColor.c3f,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/fail.png',
                fit: BoxFit.cover,
                width: 245.w,
                height: 258.w,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 80.h,
                  bottom: 20.h,
                ),
                child: Text(
                  '失败只有一种,那就是半途而废',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PingFang SC',
                    color: GlobalColor.c3f,
                  ),
                ),
              ),
              BtnWidget(
                onClick: () {
                  Get.back(); //初步强制性不允许返回
                },
                btnWidth: 192.w,
                btnText: '返回',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
