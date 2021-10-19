import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learn/common/controller/register_controller.dart';
import 'package:learn/common/global/public.dart';
import 'package:learn/common/widgets/agreement_privacy.dart';
import 'package:learn/common/widgets/button.dart';
import 'package:learn/common/widgets/text_input.dart';
import 'package:learn/common/widgets/top_appbar.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final RegisterController rc = Get.put(RegisterController());
    return SelfAppbar(
      onBack: () {
        Get.back();
      },
      txt: '注册',
      mainContent: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 45.w,
                  top: 74.h,
                  right: 174.5.w,
                ),
                child: Text(
                  '你好',
                  style: TextStyle(
                    color: GlobalColor.c3f,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PingFang SC',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 15.h,
                ),
                child: Image.asset(
                  'assets/star.png',
                  fit: BoxFit.fill,
                  width: 119.w,
                  height: 80.w,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 45.w,
              top: 12.h,
              right: 166.w,
            ),
            child: Text(
              '欢迎来到SButler',
              style: TextStyle(
                color: GlobalColor.c3f,
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
                fontFamily: 'PingFang SC',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 45.w,
              top: 12.w,
              right: 304.w,
            ),
            child: Container(
              width: 26.w,
              height: 5.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.w),
                color: GlobalColor.c4d6,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Center(
            child: Column(
              children: [
                //手机号
                LoginAndRegisterInputWidget(
                  hintText: '手机号',
                  node: rc.accountFocus,
                  controller: rc.accountController,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Obx(
                    () => Text(
                      '${rc.accountErrorText}',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                //昵称
                LoginAndRegisterInputWidget(
                  hintText: '昵称',
                  node: rc.nickNameFocus,
                  controller: rc.nickNameController,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Obx(
                    () => Text(
                      '${rc.nickNameErrorText}',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                //密码
                LoginAndRegisterInputWidget(
                  hintText: '密码',
                  node: rc.pwdFocus,
                  obscureText: true,
                  controller: rc.pwdController,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Obx(
                    () => Text(
                      '${rc.pwdErrorText}',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                //再次输入密码
                LoginAndRegisterInputWidget(
                  hintText: '再次输入密码',
                  node: rc.pwd2Focus,
                  obscureText: true,
                  controller: rc.pwd2Controller,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  child: Obx(
                    () => Text(
                      '${rc.pwd2ErrorText}',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                //按钮
                BtnWidget(
                  onClick: () {
                    print('点击了 下一步 按钮');
                    rc.registerApi();
                  },
                  btnWidth: 192.w,
                  btnHeight: 46.h,
                  btnText: '下一步',
                ),
                SizedBox(
                  height: 40.h,
                ),
                const AgreementAndPrivacy(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UploadPhoto extends StatelessWidget {
  const UploadPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SelfAppbar(
        onBack: () {
          Get.back();
        },
        txt: '上传头像',
        mainContent: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 48.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 45.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '上传头像',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 22.sp,
                        fontFamily: 'PingFang SC',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      '让我们更好认识你',
                      style: TextStyle(
                        color: GlobalColor.c3f,
                        fontSize: 22.sp,
                        fontFamily: 'PingFang SC',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      width: 26.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: GlobalColor.c4d6,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 39.w,
                  top: 32.h,
                  right: 42.w,
                  bottom: 51.h,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 104.h, right: 30.w),
                      child: Image.asset(
                        'assets/left_star.png',
                        fit: BoxFit.fill,
                        width: 36.81.w,
                        height: 40.35.w,
                      ),
                    ),
                    Container(
                      width: 163.w,
                      height: 163.w,
                      decoration: BoxDecoration(
                        color: GlobalColor.cd5,
                        borderRadius: BorderRadius.circular(81.5.w),
                        border: Border.all(
                          width: 4.w,
                          color: GlobalColor.c3f,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 133.h, left: 33.w),
                      child: Image.asset(
                        'assets/right_star.png',
                        fit: BoxFit.fill,
                        width: 27.72.w,
                        height: 29.84.w,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(
                          Stack(
                            children: [
                              Positioned(
                                left: 0.w,
                                right: 0.w,
                                bottom: 0.w,
                                height: 160.w,
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
                                      // Center(
                                      //   child: _image == null ? Text('没有选择任何图片') : Image.file(_image!),
                                      // ),
                                      //拍照上传
                                      GestureDetector(
                                        onTap: () {
                                          print('拍照上传');
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
                                          print('从相册中选择');
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
                                        color: GlobalColor.bgColor3,
                                      ),
                                      //取消
                                      GestureDetector(
                                        onTap: () {
                                          print('取消');
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
                          ),
                        );
                      },
                      //上传头像
                      child: BtnWidget(
                        btnText: '上传头像',
                        btnWidth: 160.w,
                        btnHeight: 36.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Btn2Widget(
                    onClick: () {},
                    width: 160.w,
                    height: 36.h,
                    text: '暂时跳过',
                    textColor: GlobalColor.c3f,
                    borderColor: GlobalColor.c3f,
                    borderSize: 1.w,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
