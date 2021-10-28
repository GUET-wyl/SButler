import 'package:SButler/global/public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//全背景图
class BackPictureWidget extends StatelessWidget {
  final Widget content;
  BackPictureWidget({
    Key? key,
    required this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.c30,
      body: Stack(
        children: [
          Positioned(
            width: GlobalSize.width,
            height: GlobalSize.height,
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.fill,
              width: GlobalSize.width,
              height: GlobalSize.height,
            ),
          ),
          Container(
            child: content,
          )
        ],
      ),
    );
  }
}

//非全背景图
class BackPictureWidget2 extends StatelessWidget {
  final Widget content2;
  BackPictureWidget2({
    Key? key,
    required this.content2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.c30,
      body: Stack(
        children: [
          Positioned(
            top: 128.h,
            width: GlobalSize.width,
            height: 684.h,
            child: Image.asset(
              'assets/images/bg2.png',
              fit: BoxFit.fill,
              width: GlobalSize.width,
              height: 684.h,
            ),
          ),
          Container(
            child: content2,
          )
        ],
      ),
    );
  }
}
