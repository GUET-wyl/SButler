import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/common/global/public.dart';

class LoginAndRegisterInputWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? node;
  final bool? obscureText;
  final String? hintText;
  const LoginAndRegisterInputWidget({
    Key? key,
    this.controller,
    this.node,
    this.obscureText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
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
                  hintText: '$hintText',
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
            // GestureDetector(
            //   child: Image.asset(
            //     'assets/close_eyes.png',
            //     fit: BoxFit.fill,
            //     width: 21.w,
            //     height: 9.w,
            //     color: Colors.white.withOpacity(0.5),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
