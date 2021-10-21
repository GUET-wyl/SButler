import 'package:SButler/common/controller/login_controller.dart';
import 'package:SButler/common/global/public.dart';
import 'package:SButler/common/widgets/button.dart';
import 'package:SButler/common/widgets/dialog.dart';
import 'package:SButler/common/widgets/top_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetPage extends StatelessWidget {
  SetPage({Key? key}) : super(key: key);
  final LoginController lc = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    var obscureText;
    var node;
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
                        Get.back();
                        Get.toNamed('/');
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
