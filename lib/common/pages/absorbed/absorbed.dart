import 'package:SButler/common/global/public.dart';
import 'package:SButler/common/widgets/button.dart';
import 'package:SButler/common/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AbsorbedPage extends StatelessWidget {
  AbsorbedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar4(
        onBack: () {
          Get.back();
        },
        txt: '创建',
        mainContent: Center(
          child: Padding(
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
                        'assets/taskname.png',
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
                    child: TextField(
                      // controller: controller,
                      maxLength: 15,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: GlobalColor.c3f,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'PingFang SC',
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 12.h),
                        hintText: '任务标题',
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
                //专注时间
                Padding(
                  padding: EdgeInsets.only(
                    top: 23.h,
                    bottom: 15.h,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/big_time.png',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: GlobalColor.c4d6,
                        ),
                        child: SizedBox(
                          width: 78.w,
                          height: 40.h,
                          child: Center(
                            child: Text(
                              '0.5小时',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: GlobalColor.c3f,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PingFang SC',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: GlobalColor.c1a,
                        ),
                        child: SizedBox(
                          width: 78.w,
                          height: 40.h,
                          child: Center(
                            child: Text(
                              '1小时',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: GlobalColor.c3f,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PingFang SC',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: GlobalColor.c1a,
                        ),
                        child: SizedBox(
                          width: 78.w,
                          height: 40.h,
                          child: Center(
                            child: Text(
                              '2小时',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: GlobalColor.c3f,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'PingFang SC',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: GlobalColor.c1a, //可变
                        ),
                        child: SizedBox(
                          width: 78.w,
                          height: 40.h,
                          child: Center(
                            child: Text(
                              '自定义',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: GlobalColor.c3f.withOpacity(.2),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'PingFang SC',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
                        'assets/challenge_money.png',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: GlobalColor.c4d6,
                        ),
                        child: SizedBox(
                          width: 78.w,
                          height: 42.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: GlobalColor.c3f,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PingFang SC',
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                '金币',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: GlobalColor.c3f,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PingFang SC',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: GlobalColor.c1a,
                        ),
                        child: SizedBox(
                          width: 78.w,
                          height: 42.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '20',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: GlobalColor.c3f,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PingFang SC',
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                '金币',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: GlobalColor.c3f,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PingFang SC',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: GlobalColor.c1a,
                        ),
                        child: SizedBox(
                          width: 78.w,
                          height: 42.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '88',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: GlobalColor.c3f,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PingFang SC',
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                '金币',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: GlobalColor.c3f,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PingFang SC',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 15.h,
                    bottom: 100.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: GlobalColor.c4d6,
                          ),
                          child: SizedBox(
                            width: 78.w,
                            height: 42.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '100',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: GlobalColor.c3f,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PingFang SC',
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  '金币',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: GlobalColor.c3f,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PingFang SC',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: GlobalColor.c1a,
                          ),
                          child: SizedBox(
                            width: 78.w,
                            height: 42.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '200',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: GlobalColor.c3f,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PingFang SC',
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  '金币',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: GlobalColor.c3f,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PingFang SC',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: GlobalColor.c1a,
                          ),
                          child: SizedBox(
                            width: 78.w,
                            height: 42.h,
                            child: Center(
                              child: Text(
                                '自定义',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: GlobalColor.c3f.withOpacity(.2),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'PingFang SC',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BtnWidget(
                  onClick: () {
                    Get.toNamed('/task');
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
