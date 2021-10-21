import 'package:flutter/material.dart';
import 'package:SButler/common/global/public.dart';

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
            top: 128.h,
            width: GlobalSize.width,
            height: GlobalSize.height,
            child: Image.asset(
              'assets/bg.png',
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
              'assets/bg.png',
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
