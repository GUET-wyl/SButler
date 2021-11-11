import 'package:SButler/global/public.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//用户协议和隐私政策
class AgreementAndPrivacy extends StatelessWidget {
  const AgreementAndPrivacy({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 17.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              text: '登录即代表同意',
              style: TextStyle(
                fontSize: 12.sp,
                color: GlobalColor.c3f,
                fontWeight: FontWeight.w400,
                fontFamily: 'PingFang SC',
              ),
              children: [
                TextSpan(
                  text: '用户协议',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: GlobalColor.c4d6,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PingFang SC',
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed('/user_agreement');
                    },
                ),
                TextSpan(
                  text: '和',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: GlobalColor.c3f,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PingFang SC',
                  ),
                ),
                TextSpan(
                  text: '隐私政策',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: GlobalColor.c4d6,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'PingFang SC',
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed('/privacy_policy');
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
