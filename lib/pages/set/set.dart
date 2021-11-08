import 'package:SButler/controller/logout_controller.dart';
import 'package:SButler/widgets/button.dart';
import 'package:SButler/widgets/dialog.dart';
import 'package:SButler/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetPage extends StatelessWidget {
  SetPage({Key? key}) : super(key: key);
  final LogoutController sc = Get.put(LogoutController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar(
        onBack: () {
          Get.back();
        },
        txt: '设置',
        mainContent: Padding(
          padding: EdgeInsets.only(
            top: 636.h,
          ),
          child: Center(
            child: BtnWidget(
              onClick: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DialogWidget1(
                      toast: '确定要退出登录吗？',
                      onOk: () {
                        sc.logoutApi();
                      },
                      onCancel: () {
                        Get.back();
                      },
                    );
                  },
                );
              },
              btnText: '退出登录',
              btnWidth: 232.w,
              btnHeight: 46.h,
            ),
          ),
        ),
      ),
    );
  }
}
