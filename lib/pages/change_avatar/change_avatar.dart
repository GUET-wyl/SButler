import 'dart:io';
import 'package:SButler/controller/register_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/button.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChangeAvatar extends StatelessWidget {
  ChangeAvatar({Key? key}) : super(key: key);
  final RegisterController rc = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar(
        onBack: () {
          Get.back();
        },
        txt: '上传头像',
        mainContent: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 38.h,
                  bottom: 72.h,
                ),
                child: //展示图片
                    Obx(
                  () => rc.selectedImagePath.value == ''
                      ? Container(
                          width: 280.w,
                          height: 280.w,
                          decoration: BoxDecoration(
                            color: GlobalColor.cd5,
                            borderRadius: BorderRadius.circular(140.w),
                            border: Border.all(
                              width: 2.w,
                              color: GlobalColor.c3f,
                            ),
                          ),
                        )
                      : ClipOval(
                          child: Image.file(
                            File(rc.selectedImagePath.value),
                            height: 280.w,
                            width: 280.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      rc.getImage(ImageSource.gallery);
                    },
                    child: Btn2Widget(
                      width: 160.w,
                      height: 36.h,
                      text: '从相册选择',
                      textColor: GlobalColor.c3f,
                      borderColor: GlobalColor.c3f,
                      borderRadiusSize: 21.r,
                      borderSize: 1.w,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Btn2Widget(
                    onClick: () {
                      rc.getImage(ImageSource.camera);
                    },
                    width: 160.w,
                    height: 36.h,
                    text: '拍照上传',
                    textColor: GlobalColor.c3f,
                    borderColor: GlobalColor.c3f,
                    borderRadiusSize: 21.r,
                    borderSize: 1.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}