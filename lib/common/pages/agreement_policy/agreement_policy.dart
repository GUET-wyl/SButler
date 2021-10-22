import 'package:SButler/common/controller/login_controller.dart';
import 'package:SButler/common/global/public.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AgreementPolicy extends StatelessWidget {
  AgreementPolicy({Key? key}) : super(key: key);
  final LoginController lc = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
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
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 220.w,
                      height: 50.h,
                      child: TextField(
                        controller: lc.pwdController,
                        obscureText: lc.obscureText.value,
                        focusNode: lc.pwdFocus,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: GlobalColor.c3f,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'PingFang SC',
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.only(top: 15.w, bottom: 15.w),
                          hintText: '请输入密码',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: GlobalColor.c3f.withOpacity(.2),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PingFang SC',
                          ),
                          border: InputBorder.none,
                        ),
                        cursorColor: GlobalColor.c3f,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          lc.toggleEyes();
                        },
                        child: lc.obscureText.value
                            ? Image.asset(
                                'assets/images/close_eyes.png',
                                fit: BoxFit.cover,
                                width: 21.w,
                                height: 9.w,
                                color: Colors.white.withOpacity(0.5),
                              )
                            : Image.asset(
                                'assets/images/open_eyes.png',
                                fit: BoxFit.cover,
                                width: 24.w,
                                height: 14.w,
                                color: Colors.white.withOpacity(0.5),
                              )),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
