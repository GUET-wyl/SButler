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
                      padding: const EdgeInsets.all(12.0),
                      child: ListView(
                        children: [
                          TextField(
                            // controller: controller,
                            // maxLines: 4,
                            // maxLength: 200,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: GlobalColor.c3f,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'PingFang SC',
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                bottom: 100.h,
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
                          Divider(
                            color: GlobalColor.c3f.withOpacity(.1),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '添加图片说明(选填)',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: GlobalColor.cfa.withOpacity(.8),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'PingFang SC',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Obx(
                                    () => rc.selectedImagePath.value == ''
                                        ? GestureDetector(
                                            onTap: () {
                                              rc.getImage(ImageSource.gallery);
                                            },
                                            child: Image.asset(
                                              'assets/images/group.png',
                                              fit: BoxFit.cover,
                                              width: 96.w,
                                              height: 96.w,
                                            ),
                                          )
                                        : Image.file(
                                            File(rc.selectedImagePath.value),
                                            height: 96.w,
                                            width: 96.w,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 147.h,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 133.h,
                                  ),
                                  child: Text(
                                    num.length.toString() + '/200',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: GlobalColor.cfa.withOpacity(.2),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'PingFang SC',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Fluttertoast.showToast(
                      msg: "意见提交成功",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 3,
                      backgroundColor: Colors.black54,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  child: Image.asset(
                    'assets/images/true.png',
                    fit: BoxFit.fill,
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
