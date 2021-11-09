import 'package:SButler/global/public.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dialog.dart';

class DrawerWidget extends StatelessWidget {
  final uS = Get.find<UserInfoService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172.w,
      color: GlobalColor.c1a,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 14.w,
              top: 55.h,
              bottom: 59.h,
            ),
            child: Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  child: Center(
                      child: Obx(
                    () => selectedImagePath2.value == ''
                        ? Image.asset(
                            'assets/images/person.png',
                            width: 38.w,
                            height: 33.w,
                            fit: BoxFit.cover,
                          )
                        : ClipOval(
                            child: Image.network(
                              '${uS.loginInfo!.avatar}',
                              width: 50.w,
                              height: 50.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                  )),
                  decoration: BoxDecoration(
                    color: GlobalColor.cd5,
                    borderRadius: BorderRadius.circular(23.5.w),
                    border: Border.all(
                      width: 2.w,
                      color: GlobalColor.c3f,
                    ),
                  ),
                ),
                SizedBox(
                  width: 13.w,
                ),
                Text(
                  '${uS.loginInfo?.nickname}',
                  style: TextStyle(
                    color: GlobalColor.c3f,
                    fontSize: 16.sp,
                    fontFamily: 'PingFang SC',
                    fontWeight: FontWeight.w500,
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
            // btm: 361,
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
