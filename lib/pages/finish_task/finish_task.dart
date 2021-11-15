import 'package:SButler/controller/task_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/button.dart';
import 'package:SButler/widgets/dialog.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//结束任务
class FinishTaskPage extends StatelessWidget {
  FinishTaskPage({Key? key}) : super(key: key);
  final TaskController tc = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar4(
        onBack: () {
          Get.back();
        },
        txt: '今日份学习',
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
                  child: Stack(
                    children: [
                      //人脸区域
                      Center(
                        child: Image.asset(
                          'assets/images/person.png',
                          width: 280.w,
                          height: 280.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      //进度条
                      Positioned(
                        top: 0,
                        left: 0,
                        child: SizedBox(
                          width: 326.w,
                          height: 326.w,
                          child: //环形进度条
                              CircularProgressIndicator(
                            value: 0.1, //0~1的浮点数，用来表示进度多少;
                            backgroundColor: GlobalColor.c39, //背景色
                            strokeWidth: 10.w, //圆形进度条的粗细
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              GlobalColor.c3f,
                            ), //进度颜色
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: GlobalColor.cd5,
                    borderRadius: BorderRadius.circular(163.w),
                  ),
                ),
              ),
              //倒计时的任务时间
              Text(
                Get.arguments,
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
              //按钮
              BtnWidget(
                btnText: '结束专注',
                btnWidth: 192.w,
                onClick: () {
                  if (tc.timer.isActive) {
                    tc.timer.cancel();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogWidget1(
                          onOk: () {
                            Get.back();
                            Get.offAndToNamed('/fail_result');
                          },
                          onCancel: () {
                            //怎样暂停倒计时？
                            Get.back();
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
