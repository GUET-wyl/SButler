//用SystemUiOverlayStyle配置状态栏和导航栏，以及它们图标的颜色
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

setUi() {
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //顶部状态栏的颜色
      systemNavigationBarColor:
          Color(0xffffffff), //系统底部导航栏的颜色(仅适用于Android版本0及更高版本。)
      systemNavigationBarDividerColor: null, //系统底部导航栏和应用程序内容之间分隔符的颜色。
      systemNavigationBarIconBrightness: Brightness.light, //系统导航栏图标的亮度。
      statusBarIconBrightness: Brightness.dark, //顶部状态栏图标的亮度。
      statusBarBrightness: Brightness.light, //顶部状态栏的亮度
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
