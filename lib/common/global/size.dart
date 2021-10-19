/* 
*@description:屏幕的适配
 */
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalSize {
  //设计稿的宽度和高度
  static const double width = 375;
  static const double height = 812;

  //边距
  static final double rowPadding = ScreenUtil().setWidth(24);
  static final double columnPadding = ScreenUtil().setWidth(16);

  //初始化一些常用的size,提升性能
  static final double w4 = ScreenUtil().setWidth(4);
  static final double w8 = ScreenUtil().setWidth(8);
  static final double w12 = ScreenUtil().setWidth(12);
  static final double w14 = ScreenUtil().setWidth(14);
  static final double w16 = ScreenUtil().setWidth(16);
  static final double w18 = ScreenUtil().setWidth(18);
  static final double w20 = ScreenUtil().setWidth(20);
  static final double w24 = ScreenUtil().setWidth(24);
  static final double w32 = ScreenUtil().setWidth(32);
  static final double w36 = ScreenUtil().setWidth(36);
}
