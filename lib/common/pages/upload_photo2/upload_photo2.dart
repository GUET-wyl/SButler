import 'dart:io';
import 'package:SButler/common/controller/register_controller.dart';
import 'package:SButler/common/global/public.dart';
import 'package:SButler/common/widgets/bottom_sheet.dart';
import 'package:SButler/common/widgets/button.dart';
import 'package:SButler/common/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UploadPhoto2 extends StatelessWidget {
  UploadPhoto2({Key? key}) : super(key: key);
  final RegisterController rc = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar(
        onBack: () {
          Get.toNamed('/up_photo');
        },
        txt: '上传头像',
        mainContent: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 112.h,
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
                      padding: EdgeInsets.only(top: 175.h, right: 30.w),
                      child: Image.asset(
                        'assets/left_star.png',
                        fit: BoxFit.fill,
                        width: 36.81.w,
                        height: 40.35.w,
                      ),
                    ),
                    //展示图片
                    Obx(
                      () => rc.selectedImagePath.value == ''
                          ? Container(
                              width: 163.w,
                              height: 163.w,
                              decoration: BoxDecoration(
                                color: Color(0xffd5d5d5),
                                borderRadius: BorderRadius.circular(81.5.w),
                                border: Border.all(
                                  width: 4.w,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : ClipOval(
                              child: Image.file(
                                File(rc.selectedImagePath.value),
                                height: 163.w,
                                width: 163.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 64.h, left: 33.w),
                      child: Image.asset(
                        'assets/right_star.png',
                        fit: BoxFit.fill,
                        width: 27.72.w,
                        height: 29.84.w,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          BottomSheetWidget(),
                        );
                      },
                      //进入星球
                      child: BtnWidget(
                        onClick: () {
                          Get.toNamed(
                            '/login',
                          );
                        },
                        btnText: '进入星球',
                        btnWidth: 160.w,
                        btnHeight: 36.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        BottomSheetWidget(),
                      );
                    },
                    //重新上传
                    child: Btn2Widget(
                      width: 160.w,
                      height: 36.h,
                      text: '重新上传',
                      textColor: GlobalColor.c3f,
                      borderColor: GlobalColor.c3f,
                      borderSize: 1.w,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
