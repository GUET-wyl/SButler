import 'package:SButler/controller/register_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/widgets/agreement_privacy.dart';
import 'package:SButler/widgets/button.dart';
import 'package:SButler/widgets/text_input.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final RegisterController rc = Get.put(RegisterController());
    return SelfAppbar(
      onBack: () {
        Get.toNamed('/index');
      },
      txt: '注册',
      mainContent: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 45.w,
                  top: 74.h,
                  right: 169.w,
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
                  top: 15.h,
                ),
                child: Image.asset(
                  'assets/images/star.png',
                  fit: BoxFit.fill,
                  width: 119.w,
                  height: 80.w,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 45.w,
              top: 12.h,
              right: 166.w,
            ),
            child: Text(
              '欢迎来到SButler',
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
              top: 12.w,
              right: 304.w,
            ),
            child: Container(
              width: 26.w,
              height: 5.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                color: GlobalColor.c4d6,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Center(
            child: Column(
              children: [
                //手机号
                InputWidget(
                  hintText: '手机号',
                  node: rc.phoneFocus,
                  controller: rc.phoneController,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Obx(
                    () => Text(
                      '${rc.phoneErrorText}',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                //昵称
                InputWidget(
                  hintText: '昵称',
                  node: rc.nickNameFocus,
                  controller: rc.nickNameController,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Obx(
                    () => Text(
                      '${rc.nickNameErrorText}',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                //密码
                Input2Widget(
                  hintText: '密码',
                  controller: rc.pwd1Controller,
                  obscureText: rc.obscureText1.value,
                  node: rc.pwd1Focus,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Obx(
                    () => Text(
                      '${rc.pwd1ErrorText}',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                //再次输入密码
                Input3Widget(
                  hintText: '再次输入密码',
                  node: rc.pwd2Focus,
                  obscureText: rc.obscureText2.value,
                  controller: rc.pwd2Controller,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Obx(
                    () => Text(
                      '${rc.pwd2ErrorText}',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                //按钮
                BtnWidget(
                  onClick: () {
                    print('点击了 下一步 按钮');
                    rc.registerApi();
                  },
                  btnWidth: 192.w,
                  btnHeight: 46.h,
                  btnText: '下一步',
                ),
                SizedBox(
                  height: 40.h,
                ),
                //用户协议和隐私政策
                const AgreementAndPrivacy(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
