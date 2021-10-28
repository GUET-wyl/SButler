import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

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
                  bottom: 69.h,
                ),
                child: Text(
                  '恭喜你！专注成功',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PingFang SC',
                    color: GlobalColor.c3f,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/success.png',
                fit: BoxFit.cover,
                width: GlobalSize.width,
                height: 365.w,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 40.h,
                  bottom: 20.h,
                ),
                child: Text(
                  '给我一个支点,我就能撬起整个地球',
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
                  Get.back();
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
