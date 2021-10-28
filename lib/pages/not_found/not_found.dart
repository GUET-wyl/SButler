import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotFoundPage extends StatelessWidget {
  NotFoundPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar4(
        onBack: () {
          Get.back();
        },
        txt: '账户明细',
        mainContent: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 104.h,
                  bottom: 34.h,
                ),
                child: Image.asset(
                  'assets/images/nocon.png',
                  fit: BoxFit.fill,
                  width: 192.w,
                  height: 193.w,
                ),
              ),
              Text(
                '这里还没有数据哦',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'PingFang SC',
                  color: GlobalColor.cfa,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
