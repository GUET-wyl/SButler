import 'dart:io';
import 'package:SButler/controller/register_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/utils/image_picker.dart';
import 'package:SButler/widgets/bottom_sheet.dart';
import 'package:SButler/widgets/button.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UploadPhoto extends StatelessWidget {
  UploadPhoto({Key? key}) : super(key: key);
  final uS = Get.find<UserInfoService>();
  final RegisterController rc = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar(
        onBack: () {
          Get.toNamed('/register');
        },
        txt: '上传头像',
        mainContent: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 48.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 45.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '上传头像',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 22.sp,
                        fontFamily: 'PingFang SC',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 12.h,
                        bottom: 12.h,
                      ),
                      child: Text(
                        '让我们更好认识你',
                        style: TextStyle(
                          color: GlobalColor.c3f,
                          fontSize: 22.sp,
                          fontFamily: 'PingFang SC',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      width: 26.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: GlobalColor.c4d6,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 39.w,
                  top: 32.h,
                  right: 42.w,
                  bottom: 51.h,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 104.h, right: 30.w),
                      child: Image.asset(
                        'assets/images/left_star.png',
                        fit: BoxFit.fill,
                        width: 36.81.w,
                        height: 40.35.w,
                      ),
                    ),
                    //展示图片
                    Container(
                      width: 163.w,
                      height: 163.w,
                      child: Center(
                        child: Obx(
                          () => selectedImagePath1.value == ''
                              ? Image.asset(
                                  'assets/images/person.png',
                                  width: 124.5.w,
                                  height: 110.07.w,
                                  fit: BoxFit.cover,
                                )
                              : ClipOval(
                                  child: Image.file(
                                    File(selectedImagePath1.value),
                                    height: 163.w,
                                    width: 163.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: GlobalColor.cd5,
                        borderRadius: BorderRadius.circular(81.5.w),
                        border: Border.all(
                          width: 4.w,
                          color: GlobalColor.c3f,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 133.h, left: 33.w),
                      child: Image.asset(
                        'assets/images/right_star.png',
                        fit: BoxFit.fill,
                        width: 27.72.w,
                        height: 29.84.w,
                      ),
                    ),
                  ],
                ),
              ),
              //按钮
              Obx(
                () => selectedImagePath1.value == ''
                    ? Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 24.h),
                            child: Center(
                              child: BtnWidget(
                                onClick: () {
                                  Get.bottomSheet(
                                    BottomSheetWidget(),
                                  );
                                },
                                btnText: '上传头像',
                                btnWidth: 160.w,
                                btnHeight: 36.h,
                              ),
                            ),
                          ),
                          Btn2Widget(
                            onClick: () {
                              rc.registerApi();
                            },
                            width: 160.w,
                            height: 36.h,
                            text: '暂时跳过',
                            textColor: GlobalColor.c3f,
                            borderColor: GlobalColor.c3f,
                            borderSize: 1.w,
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 24.h),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  rc.registerApi();
                                },
                                //进入星球
                                child: BtnWidget(
                                  btnText: '进入星球',
                                  btnWidth: 160.w,
                                  btnHeight: 36.h,
                                ),
                              ),
                            ),
                          ),
                          Btn2Widget(
                            onClick: () {
                              Get.bottomSheet(
                                BottomSheetWidget(),
                              );
                            },
                            width: 160.w,
                            height: 36.h,
                            text: '重新上传',
                            textColor: GlobalColor.c3f,
                            borderColor: GlobalColor.c3f,
                            borderSize: 1.w,
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
