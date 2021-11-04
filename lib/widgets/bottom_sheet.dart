import 'package:SButler/global/public.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

//上传用户头像
class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({Key? key}) : super(key: key);
  final usService = Get.find<UserInfoService>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0.w,
          right: 0.w,
          bottom: 0.w,
          height: 164.w,
          child: Container(
            decoration: BoxDecoration(
              color: GlobalColor.c3f,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //拍照上传
                GestureDetector(
                  onTap: () {
                    uploadImage(ImageSource.gallery);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 15.h,
                      bottom: 15.h,
                    ),
                    child: Text(
                      '拍照上传',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: GlobalColor.c30,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'PingFang SC',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Divider(
                  height: 1.h,
                  color: GlobalColor.dividColor,
                ),
                //从相册中选择
                GestureDetector(
                  onTap: () {
                    uploadImage(ImageSource.gallery);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 15.h,
                      bottom: 15.h,
                    ),
                    child: Text(
                      '从相册中选择',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: GlobalColor.c30,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'PingFang SC',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  height: 9.h,
                  color: GlobalColor.c32,
                ),
                //取消
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 15.h,
                      bottom: 15.h,
                    ),
                    child: Text(
                      '取消',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: GlobalColor.c30,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'PingFang SC',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
