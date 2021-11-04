import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//任务明细
// ignore: must_be_immutable
class TaskDetails extends StatelessWidget {
  TaskDetails({Key? key}) : super(key: key);
  String time = '0', time2 = '0', coin = '0';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar4(
        onBack: () {
          Get.back();
        },
        txt: '账户明细',
        mainContent: Padding(
            padding: EdgeInsets.only(
              top: 28.h,
              left: 22.w,
              right: 17.w,
            ),
            child: ListView(
              children: [
                //一条条的数据
                Padding(
                  padding: EdgeInsets.only(bottom: 28.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '开始时间:' + time,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f.withOpacity(.7),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            '专注失败',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f.withOpacity(.7),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '学习时长:' + time2,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f.withOpacity(.7),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            '金币明细:' + coin,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f.withOpacity(.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 28.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '开始时间:' + time,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f.withOpacity(.7),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            '专注失败',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f.withOpacity(.7),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '学习时长:' + time2,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f.withOpacity(.7),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            '金币明细:' + coin,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f.withOpacity(.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
