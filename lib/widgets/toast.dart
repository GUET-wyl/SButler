import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> toastInfo({
  required String msg,
  Color? backgroundColor,
  Color? textColor,
  double? size,
  int? showTime,
  ToastGravity? location,
  Toast? length,
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    toastLength: length ?? Toast.LENGTH_SHORT,
    gravity: location ?? ToastGravity.TOP,
    timeInSecForIosWeb: showTime ?? 3,
    backgroundColor: backgroundColor ?? Colors.red,
    textColor: textColor ?? Colors.white,
    fontSize: size ?? 16.sp,
  );
}
