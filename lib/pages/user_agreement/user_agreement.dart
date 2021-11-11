import 'package:SButler/common/user_agreement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UserAgreement extends StatelessWidget {
  const UserAgreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: [
        Text(
          userAgreement,
        ),
        SizedBox(
          height: 100.h,
        ),
        SizedBox(
          width: 50,
          height: 32,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('退出'),
          ),
        )
      ],
    )));
  }
}
