import 'package:SButler/common/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: [
        Text(
          privacyPolicy,
        ),
        SizedBox(
          height: 20.h,
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
