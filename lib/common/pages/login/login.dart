import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learn/common/global/public.dart';
import 'package:learn/common/widgets/agreement_privacy.dart';
import 'package:learn/common/widgets/button.dart';
import 'package:learn/common/widgets/top_appbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  get controller => null;

  @override
  Widget build(BuildContext context) {
    var obscureText;
    var node;
    return SafeArea(
      child: SelfAppbar(
        onBack: () {
          Get.back();
        },
        txt: '登录',
        mainContent: ListView(
          children: [
            SizedBox(
              height: 36.h,
            ),
            //LOGO
            Center(
              child: Image.asset(
                'assets/star.png',
                fit: BoxFit.fill,
                width: 119.w,
                height: 80.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 45.w,
                top: 19.h,
                right: 280.w,
              ),
              child: Text(
                '你好',
                style: TextStyle(
                  color: GlobalColor.c3f,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'PingFang SC',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 45.w,
                top: 12.h,
                right: 100.w,
              ),
              child: Text(
                '欢迎回到SButler',
                style: TextStyle(
                  color: GlobalColor.c3f,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'PingFang SC',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 45.w,
                top: 12.h,
                right: 304.w,
              ),
              child: Container(
                width: 26.w,
                height: 5.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: GlobalColor.c4d6,
                ),
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            Center(
              child: Column(
                children: [
                  //手机号
                  Container(
                    width: 281.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: GlobalColor.c1a,
                      borderRadius: BorderRadius.circular(29.r),
                    ),
                    child: TextField(
                      controller: controller,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: GlobalColor.c3f,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'PingFang SC',
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(12.w, 15.h, 12.w, 15.h),
                        hintText: '手机号',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: GlobalColor.c3f.withOpacity(.2),
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                      ),
                      obscureText: obscureText ?? false,
                      focusNode: node,
                      cursorColor: GlobalColor.c3f,
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                  ),
                  //密码
                  Container(
                    width: 281.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: GlobalColor.c1a,
                      borderRadius: BorderRadius.circular(29.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 12.w,
                        right: 12.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 220.w,
                            height: 50.h,
                            child: TextField(
                              controller: controller,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: GlobalColor.c3f,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'PingFang SC',
                              ),
                              decoration: InputDecoration(
                                isDense: false,
                                contentPadding:
                                    EdgeInsets.only(top: 15.h, bottom: 15.w),
                                hintText: '密码',
                                hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: GlobalColor.c3f.withOpacity(.2),
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                              ),
                              obscureText: obscureText ?? false,
                              focusNode: node,
                              cursorColor: GlobalColor.c3f,
                            ),
                          ),
                          GestureDetector(
                            child: Image.asset(
                              'assets/open_eyes.png',
                              fit: BoxFit.fill,
                              width: 24.w,
                              height: 14.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 116.h,
                  ),
                  //按钮
                  BtnWidget(
                    btnText: '进入星球',
                    btnWidth: 192.w,
                    btnHeight: 46.h,
                  ),
                  SizedBox(
                    height: 120.h,
                  ),
                  const AgreementAndPrivacy(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
