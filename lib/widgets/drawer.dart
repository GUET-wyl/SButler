import 'package:SButler/global/public.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dialog.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);
  final uS = Get.find<UserInfoService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      color: GlobalColor.c1a,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 14.w,
              top: 55.h,
              bottom: 59.h,
            ),
            child: Row(
              children: [
                //显示用户头像
                TextButton(
                  onPressed: () {
                    changeImage(ImageSource.gallery);
                  },
                  child: ClipOval(
                    child: Image.network(
                      '${uS.loginInfo?.avatar}',
                      width: 47.w,
                      height: 47.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //显示用户昵称
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogWidget(
                          onOk: () {
                            Get.back();
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    '${uS.loginInfo?.nickname}',
                    style: TextStyle(
                      color: GlobalColor.c3f,
                      fontSize: 15.sp,
                      fontFamily: 'PingFang SC',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _DrawerCon(
            onClick: () {
              uS.getUserBalanceApi();
            },
            photo: Image.asset(
              'assets/images/account.png',
              width: 20.w,
              height: 20.w,
              fit: BoxFit.cover,
            ),
            txt: '我的账户',
          ),
          _DrawerCon(
            onClick: () {
              uS.getUserStudyHistory();
            },
            photo: Image.asset(
              'assets/images/record.png',
              width: 20.w,
              height: 20.w,
              fit: BoxFit.cover,
            ),
            txt: '学习记录',
          ),
          _DrawerCon(
            onClick: () {
              Get.toNamed('/change_avatar');
            },
            photo: Image.asset(
              'assets/images/photo.png',
              width: 20.w,
              height: 20.w,
              fit: BoxFit.cover,
            ),
            txt: '头像修改',
          ),
          _DrawerCon(
            onClick: () {
              print('昵称修改');
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) {
                  return DialogWidget(
                    onOk: () {
                      Get.back();
                    },
                  );
                },
              );
            },
            photo: Image.asset(
              'assets/images/nickname.png',
              width: 20.w,
              height: 20.w,
              fit: BoxFit.cover,
            ),
            txt: '昵称修改',
          ),
          _DrawerCon(
            onClick: () {
              Get.toNamed('/feedback');
            },
            photo: Image.asset(
              'assets/images/feedback.png',
              width: 20.w,
              height: 20.w,
              fit: BoxFit.cover,
            ),
            txt: '意见反馈',
          ),
          _DrawerCon(
            onClick: () {
              Get.toNamed('/logout');
            },
            photo: Image.asset(
              'assets/images/set.png',
              width: 20.w,
              height: 20.w,
              fit: BoxFit.cover,
            ),
            txt: '设置',
          ),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _DrawerCon({
  double? btm,
  void Function()? onClick,
  required String txt,
  required Widget photo,
}) {
  return Padding(
    padding: EdgeInsets.only(
      left: 16.w,
      bottom: btm ?? 33.h,
    ),
    child: GestureDetector(
      onTap: onClick,
      child: Row(
        children: [
          photo,
          SizedBox(
            width: 4.w,
          ),
          Text(
            txt,
            style: TextStyle(
              color: GlobalColor.c3f,
              fontSize: 13.sp,
              fontFamily: 'PingFang SC',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    ),
  );
}
