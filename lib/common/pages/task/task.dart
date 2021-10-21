import 'package:SButler/common/global/public.dart';
import 'package:SButler/common/widgets/button.dart';
import 'package:SButler/common/widgets/dialog.dart';
import 'package:SButler/common/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//任务
class TaskPage extends StatelessWidget {
  TaskPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar4(
        onBack: () {
          Get.back();
        },
        txt: '今日份学习', //任务标题----动态修改
        mainContent: Center(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: 46.h,
                    bottom: 35.h,
                  ),
                  child: Container(
                    width: 326.w,
                    height: 326.w,
                    child: Center(
                      child: Image.asset(
                        'assets/person.png',
                        width: 280.w,
                        height: 280.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: GlobalColor.cd5,
                      borderRadius: BorderRadius.circular(163.w),
                      border: Border.all(
                        width: 4.w,
                        color: GlobalColor.c3f,
                      ),
                    ),
                  )),
              Text(
                '30:36',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FandolHei',
                  color: GlobalColor.c3f,
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              BtnWidget(
                btnText: '结束专注',
                btnWidth: 192.w,
                onClick: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DialogWidget1(
                        onOk: () {
                          Get.back();
                          Get.toNamed('/fail_results');
                        },
                        onCancel: () {
                          Get.back();
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
