import 'package:SButler/common/controller/login_controller.dart';
import 'package:SButler/common/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:SButler/common/global/public.dart';
import 'package:get/get.dart';

//非密码框
class InputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? node;
  final bool? obscureText;
  final String? hintText;
  var btnBgColor;
  InputWidget({
    Key? key,
    this.controller,
    this.node,
    this.obscureText,
    required this.hintText,
    this.btnBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 281.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: btnBgColor ?? GlobalColor.c1a,
        borderRadius: BorderRadius.circular(29.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
        ),
        child: SizedBox(
          width: 220.w,
          height: 50.h,
          child: TextField(
            controller: controller,
            obscureText: obscureText ?? false,
            focusNode: node,
            style: TextStyle(
              fontSize: 14.sp,
              color: GlobalColor.c3f,
              fontWeight: FontWeight.w500,
              fontFamily: 'PingFang SC',
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(top: 15.w, bottom: 15.w),
              hintText: hintText,
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
      ),
    );
  }
}

//密码页----密码框
class Input1Widget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? node;
  final bool? obscureText;
  final String? hintText;
  var btnBgColor;
  Input1Widget({
    Key? key,
    this.controller,
    this.node,
    this.obscureText,
    required this.hintText,
    this.btnBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController lc = Get.put(LoginController());
    return Container(
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
                      contentPadding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                      hintText: hintText,
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
    );
  }
}

//注册页----密码框
class Input2Widget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? node;
  final bool? obscureText;
  final String? hintText;
  var btnBgColor;
  Input2Widget({
    Key? key,
    this.controller,
    this.node,
    this.obscureText,
    required this.hintText,
    this.btnBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController rc = Get.put(RegisterController());
    return Container(
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
                    controller: rc.pwd1Controller,
                    obscureText: rc.obscureText.value,
                    focusNode: rc.pwdFocus,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: GlobalColor.c3f,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PingFang SC',
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                      hintText: hintText,
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
                      rc.toggleEyes();
                    },
                    child: rc.obscureText.value
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
    );
  }
}

//注册页----再次输入密码框
class Input3Widget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? node;
  final bool? obscureText;
  final String? hintText;
  var btnBgColor;
  Input3Widget({
    Key? key,
    this.controller,
    this.node,
    this.obscureText,
    required this.hintText,
    this.btnBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController rc = Get.put(RegisterController());
    return Container(
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
                    controller: rc.pwd2Controller,
                    obscureText: rc.obscureText.value,
                    focusNode: rc.pwdFocus,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: GlobalColor.c3f,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'PingFang SC',
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                      hintText: hintText,
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
                      rc.toggleEyes();
                    },
                    child: rc.obscureText.value
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
    );
  }
}
