import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:learn/common/global/color.dart';

class RegisterController extends GetxController {
  String account = '', password = '';
  var accountValue, pwdValue, pwd2Value, nickName;
  //获取账号输入框的值
  getAccountValue() {
    accountValue = accountController.text;
    print('手机号为:$accountValue');
  }

  //获取昵称输入框的值
  getNickValue() {
    nickName = nickNameController.text;
    print('昵称为:$nickName');
  }

  //获取密码输入框的值
  getPwdValue() {
    pwdValue = pwdController.text;
    print('密码为:$pwdValue');
  }

  //获取确认密码输入框的值
  getPwd2Value() {
    pwd2Value = pwd2Controller.text;
    print('密码2为:$pwd2Value');
  }

  //文本控制器
  TextEditingController accountController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwd2Controller = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  //焦点控制器
  var accountFocus = FocusNode();
  var pwdFocus = FocusNode();
  var pwd2Focus = FocusNode();
  var nickNameFocus = FocusNode();
  //错误提示文本
  var accountErrorText = ''.obs;
  var pwdErrorText = ''.obs;
  var pwd2ErrorText = ''.obs;
  var nickNameErrorText = ''.obs;
  //正则表达式
  static const regAccount =
      r"^1(3[0-9]|4[01456879]|5[0-35-9]|6[2567]|7[0-8]|8[0-9]|9[0-35-9])\\d{8}$"; //验证11位手机号
  static const regNickName = r"^[a-zA-Z0-9]{4,16}$"; //验证中文
  static const regPassword = r"^[a-zA-Z0-9%&',;=?$/_\\x22]{6,16}$";
  //非空判断、错误文本提示
  void reAccount() {
    if (accountController.text == '') {
      accountErrorText.value = '手机号不能为空!';
    } else if (!RegExp(regAccount).hasMatch(accountController.text)) {
      accountErrorText.value = '手机号格式不正确!';
    } else {
      accountErrorText.value = '';
    }
  }

  void reNickName() {
    if (nickNameController.text == '') {
      nickNameErrorText.value = '昵称不能为空!';
    } else if (!RegExp(regNickName).hasMatch(nickNameController.text)) {
      nickNameErrorText.value = '请输入中文昵称!';
    } else {
      nickNameErrorText.value = '';
    }
  }

  void rePassword() {
    if (pwdController.text == '') {
      pwdErrorText.value = '密码不能为空!';
    } else if (!RegExp(regPassword).hasMatch(pwdController.text)) {
      pwdErrorText.value = '密码由6~12位数字、大小写字母组成!';
    } else {
      pwdErrorText.value = '';
    }
  }

  void reRepassword() {
    if (pwd2Controller.text == '') {
      pwd2ErrorText.value = '密码不能为空!';
    } else if (!RegExp(regPassword).hasMatch(pwd2Controller.text)) {
      pwd2ErrorText.value = '密码由6~12位数字、大小写字母组成!';
    } else if (pwd2Controller.text != pwdController.text) {
      pwd2ErrorText.value = '两次输入的密码不同!';
    }
  }

  //注册按钮
  void registerApi() async {
    getAccountValue();
    getPwdValue();
    getPwd2Value();
    getNickValue();
    if (RegExp(regAccount).hasMatch(accountController.text) &&
        RegExp(regNickName).hasMatch(nickNameController.text) &&
        RegExp(regPassword).hasMatch(pwdController.text) &&
        pwd2Controller.text == pwdController.text) {
      //开启轻提示toast
      Fluttertoast.showToast(
        msg: "register...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      //用户注册api
      var dio = Dio();
      dio.options.baseUrl = 'http://172.16.8.146/study-butler';
      var res = await dio.post(
        '/auth/register',
        data: {
          "username": accountValue,
          "password": pwdValue,
          "nickname": nickName,
        },
      );
      print('注册接口：${res.data["code"]}');
      if (res.data["code"] == 200) {
        //注册成功
        Fluttertoast.cancel(); //关闭清提示toast
        Get.toNamed('/up_photo'); //页面跳转
      } else {
        //api请求失败
        return;
      }
    }
  }

//开启监听输入框是否有值
  @override
  void onInit() {
    accountFocus.addListener(() {
      if (!accountFocus.hasFocus) {
        reAccount();
      }
    });
    nickNameFocus.addListener(() {
      if (!nickNameFocus.hasFocus) {
        reNickName();
      }
    });
    pwdFocus.addListener(() {
      if (!pwdFocus.hasFocus) {
        rePassword();
      }
    });
    pwd2Focus.addListener(() {
      if (!pwd2Focus.hasFocus) {
        reRepassword();
      }
    });
    super.onInit();
  }

//销毁控制器
  @override
  void onClose() {
    accountController.dispose();
    nickNameController.dispose();
    pwdController.dispose();
    pwd2Controller.dispose();
    accountFocus.dispose();
    nickNameFocus.dispose();
    pwdFocus.dispose();
    pwd2Focus.dispose();
    super.onClose();
  }
}
