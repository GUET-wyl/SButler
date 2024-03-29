import 'package:SButler/controller/task_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/button.dart';
import 'package:SButler/widgets/dialog.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateTask extends StatelessWidget {
  CreateTask({Key? key}) : super(key: key);
  final TaskController tc = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar4(
        onBack: () {
          Get.back();
        },
        txt: '创建',
        mainContent: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //任务名称
                Padding(
                  padding: EdgeInsets.only(
                    top: 23.h,
                    bottom: 15.h,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/taskname.png',
                        fit: BoxFit.cover,
                        width: 22.w,
                        height: 22.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        '任务名称',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'PingFang SC',
                          color: GlobalColor.c3f,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: GlobalColor.c1a,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: SizedBox(
                      width: 335.w,
                      height: 70.h,
                      child: TextField(
                        controller: tc.taskTextController,
                        focusNode: tc.taskTextFocus,
                        maxLength: 15,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: GlobalColor.c3f,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'PingFang SC',
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 15.h),
                          hintText: '请输入任务名称',
                          hintStyle: TextStyle(
                            fontSize: 14.sp,
                            color: GlobalColor.c3f.withOpacity(.2),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PingFang SC',
                          ),
                          border: InputBorder.none,
                        ),
                        cursorColor: GlobalColor.c3f,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Obx(
                    () => Text(
                      '${tc.nameErrorText}',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                //专注时间
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    bottom: 15.h,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/big_time.png',
                        fit: BoxFit.cover,
                        width: 22.w,
                        height: 22.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        '专注时间',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'PingFang SC',
                          color: GlobalColor.c3f,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 7.5,
                      childAspectRatio: 1.95,
                    ),
                    itemCount: tc.timeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          tc.onItemTap(index); //切换按钮背景色
                          if (tc.currentIndex.value ==
                              tc.timeList.asMap().keys.last) {
                            //点击的是自定义的按钮
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SelfDialog(
                                  onOk: () {
                                    tc.rexTime();
                                    tc.getSelfTaskTime();
                                    if (tc.taskTime != null &&
                                        RegExp(TaskController.regTime)
                                            .hasMatch(tc.taskTime)) {
                                      tc.timeList.last = tc.taskTime;
                                      tc.res1 = tc.timeList.last;
                                      Get.back();
                                    }
                                  },
                                  onCancel: () {
                                    Get.back();
                                  },
                                );
                              },
                            );
                          } else {
                            //点击的是非自定义按钮
                            tc.res1 = tc.timeList[index];
                            print('------非自定义按钮--------${tc.timeList[index]}');
                          }
                        },
                        child: Obx(
                          () => Container(
                            width: 78.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: tc.currentIndex.value == index
                                  ? GlobalColor.c4d6
                                  : GlobalColor.c3f.withOpacity(.1),
                            ),
                            child: Center(
                              child: Text(
                                tc.timeList.elementAt(index) + '小时', //按钮中的文字内容
                                style: TextStyle(
                                  color: tc.currentIndex.value == index
                                      ? GlobalColor.c3f
                                      : GlobalColor.c3f.withOpacity(.2),
                                  fontSize: 14.sp,
                                  fontFamily: 'PingFang SC',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //挑战金
                Padding(
                  padding: EdgeInsets.only(
                    top: 23.h,
                    bottom: 15.h,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/challenge_money.png',
                        fit: BoxFit.cover,
                        width: 22.w,
                        height: 22.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        '挑战金',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'PingFang SC',
                          color: GlobalColor.c3f,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150.h,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 23,
                      crossAxisSpacing: 30,
                      childAspectRatio: 1.85,
                    ),
                    itemCount: tc.moneyList.length,
                    itemBuilder: (BuildContext context, int idx) {
                      return GestureDetector(
                        onTap: () {
                          tc.toggleMoney(idx);
                          if (tc.crtIndex.value ==
                              tc.moneyList.asMap().keys.last) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SelfDialog1(
                                  onOk: () {
                                    tc.getSelfTaskMoney();
                                    tc.rexMoney();
                                    if (RegExp(TaskController.regMoney)
                                        .hasMatch(tc.taskMoney)) {
                                      tc.moneyList.last = tc.taskMoney;
                                      tc.res2 = int.parse(tc.moneyList.last);
                                      Get.back();
                                    }
                                  },
                                  onCancel: () {
                                    Get.back();
                                  },
                                );
                              },
                            );
                          } else {
                            //点击的是非自定义按钮
                            tc.res2 = int.parse(tc.moneyList[idx]);
                          }
                        },
                        child: Obx(
                          () => Container(
                            width: 78.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              color: tc.crtIndex.value == idx
                                  ? GlobalColor.c4d6
                                  : GlobalColor.c3f.withOpacity(.1),
                            ),
                            child: Center(
                              child: Text(
                                tc.moneyList.elementAt(idx) + '金币',
                                style: TextStyle(
                                  color: tc.crtIndex.value == idx
                                      ? GlobalColor.c3f
                                      : GlobalColor.c3f.withOpacity(.2),
                                  fontSize: 14.sp,
                                  fontFamily: 'PingFang SC',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                BtnWidget(
                  onClick: () {
                    tc.createTaskApi();
                  },
                  btnText: '创建专注',
                  btnWidth: 192.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
