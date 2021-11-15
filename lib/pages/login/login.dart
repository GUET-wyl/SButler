import 'package:SButler/controller/login_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/agreement_privacy.dart';
import 'package:SButler/widgets/button.dart';
import 'package:SButler/widgets/text_input.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController lc = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar(
        onBack: () {
          Get.toNamed('/index');
        },
        txt: '登录',
        mainContent: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 36.h,
              ),
              //LOGO
              Center(
                child: Image.asset(
                  'assets/images/star.png',
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
                    InputWidget(
                      hintText: '手机号',
                      node: lc.phoneFocus,
                      controller: lc.phoneController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.h,
                      ),
                      child: Obx(
                        () => Text(
                          '${lc.phoneErrorText}',
                          style: TextStyle(
                            color: GlobalColor.c3f,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //密码
                    Input1Widget(
                      hintText: '密码',
                      node: lc.pwdFocus,
                      obscureText: true,
                      controller: lc.pwdController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 5.h,
                      ),
                      child: Obx(
                        () => Text(
                          '${lc.pwdErrorText}',
                          style: TextStyle(
                            color: GlobalColor.c3f,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    //按钮
                    Padding(
                      padding: EdgeInsets.only(
                        top: 116.h,
                        bottom: 100.h,
                      ),
                      child: BtnWidget(
                        onClick: () {
                          lc.loginApi();
                        },
                        btnText: '进入星球',
                        btnWidth: 192.w,
                        btnHeight: 46.h,
                      ),
                    ),
                    const AgreementAndPrivacy(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
