import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/common/global/public.dart';

class SelfAppbar extends StatelessWidget {
  void Function()? onBack;
  String? txt;
  Widget mainContent;
  SelfAppbar({
    Key? key,
    this.onBack,
    this.txt,
    required this.mainContent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(44.h),
          child: AppBar(
            backgroundColor: GlobalColor.c30,
            leading: GestureDetector(
              onTap: onBack,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                ),
                child: Image.asset(
                  'assets/back.png',
                  fit: BoxFit.fill,
                  width: 28.w,
                  height: 28.w,
                ),
              ),
            ),
            title: Text(
              txt!,
              style: TextStyle(
                fontSize: 15.w,
                fontWeight: FontWeight.w400,
                fontFamily: 'PingFang SC',
                color: GlobalColor.c3f,
              ),
            ),
            centerTitle: true,
          ),
        ),
        body: Container(
          child: mainContent,
        ),
      ),
    );
  }
}
