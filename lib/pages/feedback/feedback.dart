import 'dart:io';
import 'package:SButler/controller/feedback_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeedBackPage extends StatelessWidget {
  FeedBackPage({Key? key}) : super(key: key);
  final FeedBackController fc = Get.put(FeedBackController());
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
                    bottom: 24.h,
                  ),
                  child: Container(
                    width: 335.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: GlobalColor.c3f.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 119.h,
                            child: TextField(
                              controller: fc.feedTextController,
                              focusNode: fc.feedTextFocus,
                              maxLines: 5,
                              maxLength: 200,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: GlobalColor.c3f.withOpacity(.2),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'PingFang SC',
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.only(
                                  top: 0,
                                  bottom: 12,
                                  left: 0,
                                  right: 0,
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
                          //分割线
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                            ),
                            child: Container(
                              height: 0.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.w,
                                  color: GlobalColor.c3f.withOpacity(.1),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              //上传图片
                              Obx(
                                () => GridView.builder(
                                  shrinkWrap: true, //不出现白屏
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(0.w),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 12.w,
                                    mainAxisSpacing: 12.w,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (index == fc.img.length) {
                                      return GestureDetector(
                                        onTap: () => fc.getImage(),
                                        child: Image.asset(
                                          'assets/images/group.png',
                                          fit: BoxFit.cover,
                                          width: 96.w,
                                          height: 96.w,
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        height: 96.w,
                                        width: 96.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          image: DecorationImage(
                                            image:
                                                FileImage(File(fc.img[index])),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            //删除图片
                                            Positioned(
                                              top: 7.h,
                                              right: 7.w,
                                              child: GestureDetector(
                                                onTap: () {
                                                  fc.deleteImage(index);
                                                },
                                                child: Image.asset(
                                                  'assets/images/close.png',
                                                  fit: BoxFit.cover,
                                                  width: 15.w,
                                                  height: 15.w,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  itemCount: fc.img.length < 9
                                      ? fc.img.length + 1
                                      : fc.img.length,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //提交意见反馈
                GestureDetector(
                  onTap: () {
                    fc.createFeeds();
                  },
                  child: Image.asset(
                    'assets/images/true.png',
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
