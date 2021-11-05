import 'package:SButler/controller/change_nick_controller.dart';
import 'package:SButler/controller/task_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'button.dart';

//没有取消按钮----修改昵称
class DialogWidget extends StatelessWidget {
  final Function()? onOk;
  DialogWidget({Key? key, this.onOk}) : super(key: key);
  final ChangeNickNameController nc = Get.put(ChangeNickNameController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Container(
              width: 329.w,
              height: 214.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: GlobalColor.c330,
              ),
              child: Column(
                children: [
                  Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                      color: GlobalColor.c329,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '',
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/path.png',
                                fit: BoxFit.cover,
                                width: 19.w,
                                height: 19.w,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                '修改昵称',
                                style: TextStyle(
                                  color: GlobalColor.cfa,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'PingFang SC;',
                                  fontSize: 15.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/close.png',
                              fit: BoxFit.cover,
                              width: 15.w,
                              height: 15.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: InputWidget(
                          btnBgColor: GlobalColor.c45.withOpacity(.5),
                          hintText: '请输入你的昵称',
                          node: nc.nickNameFocus,
                          controller: nc.nickNameController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5.h,
                        ),
                        child: Obx(
                          () => Text(
                            '${nc.nickNameErrorText}',
                            style: TextStyle(
                              color: GlobalColor.c3f,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ),
                      BtnWidget(
                        onClick: () {
                          nc.changeNicknameApi();
                          Get.back();
                        },
                        btnText: '确认',
                        btnWidth: 160.w,
                        btnHeight: 36.h,
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

//有取消按钮----提前结束专注、退出登录
class DialogWidget1 extends StatelessWidget {
  final Function()? onCancel, onOk;
  String? toast;
  DialogWidget1({Key? key, this.onCancel, this.onOk, this.toast})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Container(
              width: 329.w,
              height: 214.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: GlobalColor.c330,
              ),
              child: Column(
                children: [
                  Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                      color: GlobalColor.c329,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '',
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/path.png',
                                fit: BoxFit.cover,
                                width: 19.w,
                                height: 19.w,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                '提示',
                                style: TextStyle(
                                  color: GlobalColor.cfa,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'PingFang SC;',
                                  fontSize: 15.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/close.png',
                              fit: BoxFit.cover,
                              width: 15.w,
                              height: 15.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 32.h),
                        child: Text(
                          toast ?? '确定要提前结束本次专注？',
                          style: TextStyle(
                            color: GlobalColor.c3f,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'PingFang SC;',
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Btn2Widget(
                              onClick: onOk,
                              text: '确认',
                              width: 124.w,
                              height: 36.h,
                            ),
                            BtnWidget(
                              onClick: onCancel,
                              btnText: '取消',
                              btnWidth: 124.w,
                              btnHeight: 36.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

//自定义专注时间
class SelfDialog extends StatelessWidget {
  final Function()? onOk, onCancel;
  String? toast;
  SelfDialog({Key? key, this.onOk, this.onCancel}) : super(key: key);
  final TaskController tc = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Container(
              width: 329.w,
              height: 214.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: GlobalColor.c330,
              ),
              child: Column(
                children: [
                  Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                      color: GlobalColor.c329,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '',
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/path.png',
                                fit: BoxFit.cover,
                                width: 19.w,
                                height: 19.w,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                '自定义专注时间',
                                style: TextStyle(
                                  color: GlobalColor.cfa,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'PingFang SC;',
                                  fontSize: 15.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/close.png',
                              fit: BoxFit.cover,
                              width: 15.w,
                              height: 15.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: InputWidget(
                          btnBgColor: GlobalColor.c45.withOpacity(.5),
                          hintText: '请输入自定义的时间',
                          node: tc.taskTimeFocus,
                          controller: tc.taskTimeController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Btn2Widget(
                              onClick: onOk,
                              text: '确认',
                              width: 124.w,
                              height: 36.h,
                            ),
                            BtnWidget(
                              onClick: onCancel,
                              btnText: '取消',
                              btnWidth: 124.w,
                              btnHeight: 36.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

//自定义专注金币
class SelfDialog1 extends StatelessWidget {
  final Function()? onOk, onCancel;
  String? toast;
  SelfDialog1({Key? key, this.onOk, this.onCancel}) : super(key: key);
  final TaskController tc = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: Container(
              width: 329.w,
              height: 214.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: GlobalColor.c330,
              ),
              child: Column(
                children: [
                  Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                      color: GlobalColor.c329,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '',
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/path.png',
                                fit: BoxFit.cover,
                                width: 19.w,
                                height: 19.w,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                '自定义挑战金',
                                style: TextStyle(
                                  color: GlobalColor.cfa,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'PingFang SC;',
                                  fontSize: 15.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/close.png',
                              fit: BoxFit.cover,
                              width: 15.w,
                              height: 15.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: InputWidget(
                          btnBgColor: GlobalColor.c45.withOpacity(.5),
                          hintText: '请输入自定义的挑战金',
                          node: tc.taskMoneyFocus,
                          controller: tc.taskMoneyController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Btn2Widget(
                              onClick: onOk,
                              text: '确认',
                              width: 124.w,
                              height: 36.h,
                            ),
                            BtnWidget(
                              onClick: onCancel,
                              btnText: '取消',
                              btnWidth: 124.w,
                              btnHeight: 36.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
