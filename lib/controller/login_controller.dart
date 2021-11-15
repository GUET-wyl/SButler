import 'package:SButler/services/user_info.dart';
import 'package:SButler/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usService = Get.find<UserInfoService>();
  var obscureText3 = true.obs;
  //任意切换密码
  IsShowEyes() {
    obscureText3.value = !obscureText3.value;
  }

  late String phoneValue, pwdValue;
  //获取账号输入框的值
  getPhoneValue() {
    phoneValue = phoneController.text;
    print('手机号为:$phoneValue');
  }

  //获取密码输入框的值
  getPwdValue() {
    pwdValue = pwdController.text;
    print('密码为:$pwdValue');
  }

  //文本控制器
  TextEditingController phoneController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  //焦点控制器
  var phoneFocus = FocusNode();
  var pwdFocus = FocusNode();
  //错误提示文本
  var phoneErrorText = ''.obs;
  var pwdErrorText = ''.obs;
  //正则表达式
  static const regPhone =
      r"^1(3[0-9]|4[01456879]|5[0-35-9]|6[2567]|7[0-8]|8[0-9]|9[0-35-9])\d{8}$"; //验证11位手机号
  static const regPassword =
      r"^[a-zA-Z0-9%&',;=?$/_\\x22]{6,16}$"; //验证6~16位数字、大小写字母
  //非空判断、错误文本提示
  void rexPhone() {
    if (phoneController.text == '') {
      phoneErrorText.value = '手机号不能为空!';
    } else if (!RegExp(regPhone).hasMatch(phoneController.text)) {
      phoneErrorText.value = '手机号格式不正确!';
    } else {
      phoneErrorText.value = '';
    }
  }

  void rexPassword() {
    if (pwdController.text == '') {
      pwdErrorText.value = '密码不能为空!';
    } else if (!RegExp(regPassword).hasMatch(pwdController.text)) {
      pwdErrorText.value = '密码由6~16位数字、大小写字母组成!';
    } else {
      pwdErrorText.value = '';
    }
  }

  //登录按钮
  void loginApi() async {
    try {
      getPhoneValue();
      getPwdValue();
      if (RegExp(regPhone).hasMatch(phoneController.text) &&
          RegExp(regPassword).hasMatch(pwdController.text)) {
        //开启轻提示toast
        toastInfo(
          msg: 'login...',
          location: ToastGravity.BOTTOM,
        );
        await usService.login(phoneValue, pwdValue);
      }
    } catch (e) {
      print('登录接口的错误信息:$e');
    }
  }

//开启监听输入框是否有值
  @override
  void onInit() {
    phoneFocus.addListener(() {
      if (!phoneFocus.hasFocus) {
        rexPhone();
      }
    });
    pwdFocus.addListener(() {
      if (!pwdFocus.hasFocus) {
        rexPassword();
      }
    });
    super.onInit();
  }

//销毁控制器
  @override
  void onClose() {
    // phoneController.dispose();
    // pwdController.dispose();
    // phoneFocus.dispose();
    // pwdFocus.dispose();
    super.onClose();
  }
}
