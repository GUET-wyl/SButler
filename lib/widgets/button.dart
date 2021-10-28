import 'package:SButler/global/public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//无边框
class BtnWidget extends StatelessWidget {
  double? btnWidth, btnHeight, textSize, rsSize;
  final String btnText;
  FontWeight? textFw;
  Color? textColor, bgColor;
  void Function()? onClick;
  BtnWidget({
    Key? key,
    this.btnWidth,
    this.btnHeight,
    this.textSize,
    this.rsSize,
    required this.btnText,
    this.textFw,
    this.textColor,
    this.bgColor,
    this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: btnWidth ?? 232.w,
        height: btnHeight ?? 46.h,
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: textSize ?? 16.sp,
              fontWeight: textFw ?? FontWeight.w500,
              fontFamily: 'PingFang SC',
              color: textColor ?? GlobalColor.c3f,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(rsSize ?? 23.r),
          color: bgColor ?? GlobalColor.c4d6,
        ),
      ),
    );
  }
}

//带边框
Widget Btn2Widget({
  required String text,
  Color? textColor,
  Color? bgColor,
  Color? borderColor,
  FontWeight? textFw,
  double? textSize,
  double? borderSize,
  double? width,
  double? height,
  double? borderRadiusSize,
  void Function()? onClick,
}) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      width: width ?? 232.w,
      height: height ?? 46.h,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: textSize ?? 16.sp,
            fontWeight: textFw ?? FontWeight.w500,
            color: textColor ?? GlobalColor.c4d6,
            fontFamily: 'PingFang SC',
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusSize ?? 23.r),
          color: bgColor,
          border: Border.all(
            width: borderSize ?? 2.w,
            color: borderColor ?? GlobalColor.c4d6,
          )),
    ),
  );
}
