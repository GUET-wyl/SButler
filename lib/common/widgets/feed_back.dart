import 'dart:io';

import 'package:SButler/common/controller/register_controller.dart';
import 'package:SButler/common/global/public.dart';
import 'package:SButler/common/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FeedBackPage extends StatelessWidget {
  FeedBackPage({Key? key}) : super(key: key);
  final RegisterController rc = Get.put(RegisterController());
  String num = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar(
          onBack: () {
            Get.back();
          },
          txt: '意见反馈',
          mainContent: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 28.h,
                    bottom: 30.h,
                  ),
                  child: Container(
                    width: 335.w,
                    height: 316.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: GlobalColor.c3f.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        // controller: controller,
                        // maxLengthEnforcement: true,
                        maxLines: 4,
                        maxLength: 200,
                        textInputAction: TextInputAction.unspecified,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: GlobalColor.cfa.withOpacity(.2),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'PingFang SC',
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            bottom: 200.h,
                          ),
                          hintText: '请描述你的问题哦～',
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            color: GlobalColor.cfa.withOpacity(.3),
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
                GestureDetector(
                  onTap: () {
                    print('确认提交意见反馈');
                  },
                  child: Image.asset(
                    'assets/true.png',
                    fit: BoxFit.cover,
                    width: 66.w,
                    height: 66.w,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
