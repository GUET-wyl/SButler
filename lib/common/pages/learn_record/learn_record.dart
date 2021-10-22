import 'package:SButler/common/global/public.dart';
import 'package:SButler/common/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecordsPage extends StatelessWidget {
  RecordsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // String totalTimes = '0';
    // String completeTimes = '0';
    // String totalDuration = '0';
    // String month = '10';
    // String month1 = '9';
    return SafeArea(
      child: SelfAppbar4(
        onBack: () {
          Get.back();
        },
        txt: '学习记录',
        mainContent: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 31.h,
                  bottom: 24.h,
                  left: 102.w,
                  right: 101.w,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/totaldata.png',
                      fit: BoxFit.cover,
                      width: 20.w,
                      height: 23.w,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      '累计专注数据',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'PingFang SC',
                        color: GlobalColor.c3f,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: GlobalColor.c1a.withOpacity(.3),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 28.w, right: 22.w, top: 14.h, bottom: 14.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '25',
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'FandolHei',
                              color: GlobalColor.c3f,
                            ),
                          ),
                          Text(
                            '总次数',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.cfa.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '20',
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'FandolHei',
                              color: GlobalColor.c3f,
                            ),
                          ),
                          Text(
                            '完成次数',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.cfa.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'FandolHei',
                              color: GlobalColor.c3f,
                            ),
                          ),
                          Text(
                            '总时长(小时)',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.cfa.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //可滚动区域
              SizedBox(
                height: 572.h,
                child: ListView(
                  children: [
                    //10月----可复用的布局
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30.h,
                        bottom: 6.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            '10月',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: GlobalColor.c1a.withOpacity(.3),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 11.w,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/task.png',
                                          fit: BoxFit.cover,
                                          width: 13.w,
                                          height: 13.w,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '今日份学习',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'PingFang SC',
                                                color: GlobalColor.cfa,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/time.png',
                                                  fit: BoxFit.cover,
                                                  width: 10.w,
                                                  height: 10.w,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  '10月21日 下午 14:00',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'PingFang SC',
                                                    color: GlobalColor.cfa
                                                        .withOpacity(.3),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '2小时',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'PingFang SC',
                                        color: GlobalColor.cfa.withOpacity(.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/task.png',
                                          fit: BoxFit.cover,
                                          width: 13.w,
                                          height: 13.w,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '周末看书计划',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'PingFang SC',
                                                color: GlobalColor.cfa,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/time.png',
                                                  fit: BoxFit.cover,
                                                  width: 10.w,
                                                  height: 10.w,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  '10月20日 下午 14:00',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'PingFang SC',
                                                    color: GlobalColor.cfa
                                                        .withOpacity(.3),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '1小时',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'PingFang SC',
                                        color: GlobalColor.cfa.withOpacity(.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/task.png',
                                          fit: BoxFit.cover,
                                          width: 13.w,
                                          height: 13.w,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '证书考试复习',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'PingFang SC',
                                                color: GlobalColor.cfa,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/time.png',
                                                  fit: BoxFit.cover,
                                                  width: 10.w,
                                                  height: 10.w,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  '10月19日 下午 14:00',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'PingFang SC',
                                                    color: GlobalColor.cfa
                                                        .withOpacity(.3),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '0.5小时',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'PingFang SC',
                                        color: GlobalColor.cfa.withOpacity(.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    //9月
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30.h,
                        bottom: 6.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            '9月',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: GlobalColor.c1a.withOpacity(.3),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 11.w,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/task.png',
                                          fit: BoxFit.cover,
                                          width: 13.w,
                                          height: 13.w,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '日常记单词',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'PingFang SC',
                                                color: GlobalColor.cfa,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/time.png',
                                                  fit: BoxFit.cover,
                                                  width: 10.w,
                                                  height: 10.w,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  '9月21日 下午 14:00',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'PingFang SC',
                                                    color: GlobalColor.cfa
                                                        .withOpacity(.3),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '2小时',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'PingFang SC',
                                        color: GlobalColor.cfa.withOpacity(.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/task.png',
                                          fit: BoxFit.cover,
                                          width: 13.w,
                                          height: 13.w,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '日常记单词',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'PingFang SC',
                                                color: GlobalColor.cfa,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/time.png',
                                                  fit: BoxFit.cover,
                                                  width: 10.w,
                                                  height: 10.w,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  '9月20日 下午 14:00',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'PingFang SC',
                                                    color: GlobalColor.cfa
                                                        .withOpacity(.3),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '1小时',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'PingFang SC',
                                        color: GlobalColor.cfa.withOpacity(.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                    //年份
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30.h,
                      ),
                      child: Center(
                        child: Text(
                          '2020年',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PingFang SC',
                            color: GlobalColor.c3f,
                          ),
                        ),
                      ),
                    ),
                    //9月
                    Padding(
                      padding: EdgeInsets.only(
                        top: 30.h,
                        bottom: 6.h,
                      ),
                      child: Row(
                        children: [
                          Text(
                            '9月',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PingFang SC',
                              color: GlobalColor.c3f,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: GlobalColor.c1a.withOpacity(.3),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: 15.w,
                            right: 11.w,
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/task.png',
                                          fit: BoxFit.cover,
                                          width: 13.w,
                                          height: 13.w,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '日常记单词',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'PingFang SC',
                                                color: GlobalColor.cfa,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/time.png',
                                                  fit: BoxFit.cover,
                                                  width: 10.w,
                                                  height: 10.w,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  '9月21日 下午 14:00',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'PingFang SC',
                                                    color: GlobalColor.cfa
                                                        .withOpacity(.3),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '2小时',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'PingFang SC',
                                        color: GlobalColor.cfa.withOpacity(.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.h,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/task.png',
                                          fit: BoxFit.cover,
                                          width: 13.w,
                                          height: 13.w,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '日常记单词',
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'PingFang SC',
                                                color: GlobalColor.cfa,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/time.png',
                                                  fit: BoxFit.cover,
                                                  width: 10.w,
                                                  height: 10.w,
                                                ),
                                                SizedBox(
                                                  width: 3.w,
                                                ),
                                                Text(
                                                  '9月20日 下午 14:00',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'PingFang SC',
                                                    color: GlobalColor.cfa
                                                        .withOpacity(.3),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '1小时',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'PingFang SC',
                                        color: GlobalColor.cfa.withOpacity(.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
