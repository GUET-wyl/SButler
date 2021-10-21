import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  var phoneValue, pwdValue, pwd2Value, nickName;
  //获取账号输入框的值
  getPhoneValue() {
    phoneValue = phoneController.text;
    print('手机号为:$phoneValue');
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
  TextEditingController phoneController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwd2Controller = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  //焦点控制器
  var phoneFocus = FocusNode();
  var pwdFocus = FocusNode();
  var pwd2Focus = FocusNode();
  var nickNameFocus = FocusNode();
  //错误提示文本
  var phoneErrorText = ''.obs;
  var pwdErrorText = ''.obs;
  var pwd2ErrorText = ''.obs;
  var nickNameErrorText = ''.obs;
  //正则表达式
  static const regPhone =
      r"^1(3[0-9]|4[01456879]|5[0-35-9]|6[2567]|7[0-8]|8[0-9]|9[0-35-9])\d{8}$"; //验证11位手机号
  static const regNickName = r"^[\u4E00-\u9FA5A-Za-z0-9]{1,10}$"; //验证1到10位的中英文
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

  void rexNickName() {
    if (nickNameController.text == '') {
      nickNameErrorText.value = '昵称不能为空!';
    } else if (!RegExp(regNickName).hasMatch(nickNameController.text)) {
      nickNameErrorText.value = '请输入1到10位的中英文昵称!';
    } else {
      nickNameErrorText.value = '';
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

  void rexRepassword() {
    if (pwd2Controller.text == '') {
      pwd2ErrorText.value = '密码不能为空!';
    } else if (!RegExp(regPassword).hasMatch(pwd2Controller.text)) {
      pwd2ErrorText.value = '密码由6~16位数字、大小写字母组成!';
    } else if (pwd2Controller.text != pwdController.text) {
      pwd2ErrorText.value = '两次输入的密码不同!';
    }
  }

  //注册按钮
  void registerApi() async {
    getPhoneValue();
    getPwdValue();
    getPwd2Value();
    getNickValue();
    if (RegExp(regPhone).hasMatch(phoneController.text) &&
        RegExp(regNickName).hasMatch(nickNameController.text) &&
        RegExp(regPassword).hasMatch(pwdController.text) &&
        pwd2Controller.text == pwdController.text) {
      //开启轻提示toast
      Fluttertoast.showToast(
        msg: "register...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
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
          "username": phoneValue,
          "password": pwdValue,
          "nickname": nickName,
        },
      );
      // print('注册接口：${res.data["code"]}');
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
    phoneFocus.addListener(() {
      if (!phoneFocus.hasFocus) {
        rexPhone();
      }
    });
    nickNameFocus.addListener(() {
      if (!nickNameFocus.hasFocus) {
        rexNickName();
      }
    });
    pwdFocus.addListener(() {
      if (!pwdFocus.hasFocus) {
        rexPassword();
      }
    });
    pwd2Focus.addListener(() {
      if (!pwd2Focus.hasFocus) {
        rexRepassword();
      }
    });
    super.onInit();
  }

//销毁控制器
  @override
  void onClose() {
    phoneController.dispose();
    nickNameController.dispose();
    pwdController.dispose();
    pwd2Controller.dispose();
    phoneFocus.dispose();
    nickNameFocus.dispose();
    pwdFocus.dispose();
    pwd2Focus.dispose();
    super.onClose();
  }

  //image_picker组件
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb";
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // var dio = Dio();
  // 上传图片的方法
  // void uploadImg(imageUrl) async {
  //   FormData formData = FormData.fromMap({
  //     "name": "admin",
  //     "password": 123456,
  //     "file": await MultipartFile.fromFile(imageUrl, filename: "avatar.img")
  //   });
  //   var result =
  //       await dio.post("http://js.itying.com/imgupload", data: formData);
  //   print(result);
  // }
}
