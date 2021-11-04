import 'package:SButler/controller/task_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/routes/app_pages.dart';
import 'package:SButler/widgets/button.dart';
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
                  child: Container(
                    width: 335.w,
                    height: 70.h,
                    child: TextField(
                      controller: tc.taskTextController,
                      focusNode: tc.taskTextFocus,
                      maxLength: 15,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: GlobalColor.c3f.withOpacity(.2),
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
              //专注时间
              Padding(
                padding: EdgeInsets.only(
                  top: 23.h,
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
              Container(
                height: 50.h,
                child: Obx(
                  () => GridView.builder(
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
                          tc.onItemTap(index);
                        },
                        child: Container(
                          width: 78.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: tc.currentIndex == index
                                ? GlobalColor.c4d6
                                : GlobalColor.c3f.withOpacity(.1),
                          ),
                          child: Center(
                            child: Text(
                              tc.timeList.elementAt(index),
                              style: TextStyle(
                                color: GlobalColor.c3f,
                                fontSize: 14.sp,
                                fontFamily: 'PingFang SC',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
              Container(
                height: 150.h,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 23,
                    crossAxisSpacing: 30,
                    childAspectRatio: 1.85,
                  ),
                  itemCount: tc.moneyList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 78.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: GlobalColor.c4d6,
                        ),
                        child: Center(
                          child: Text(
                            tc.moneyList.elementAt(index),
                            style: TextStyle(
                              color: GlobalColor.c3f,
                              fontSize: 14.sp,
                              fontFamily: 'PingFang SC',
                              fontWeight: FontWeight.w600,
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
                  // tc.createTaskApi();
                },
                btnText: '创建专注',
                btnWidth: 192.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
