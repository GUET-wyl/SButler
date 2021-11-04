import 'dart:io';
import 'package:SButler/controller/register_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        children: [
                          Text('123'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
