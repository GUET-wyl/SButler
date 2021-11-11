import 'package:SButler/global/public.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var phoneValue, pwdValue, pwd2Value, nickName, avatar;
  final usService = Get.find<UserInfoService>();

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
    pwdValue = pwd1Controller.text;
    print('密码为:$pwdValue');
  }

  //获取确认密码输入框的值
  getPwd2Value() {
    pwd2Value = pwd2Controller.text;
    print('密码2为:$pwd2Value');
  }

  var obscureText1 = true.obs;
  var obscureText2 = true.obs;
  //任意切换密码
  toggleEyes() {
    obscureText1.value = !obscureText1.value;
  }

  //任意切换密码2
  toggleEyes2() {
    obscureText2.value = !obscureText2.value;
  }

  //文本控制器
  TextEditingController phoneController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController pwd1Controller = TextEditingController();
  TextEditingController pwd2Controller = TextEditingController();

  //焦点控制器
  var phoneFocus = FocusNode();
  var nickNameFocus = FocusNode();
  var pwd1Focus = FocusNode();
  var pwd2Focus = FocusNode();
  //错误提示文本
  var phoneErrorText = ''.obs;
  var nickNameErrorText = ''.obs;
  var pwd1ErrorText = ''.obs;
  var pwd2ErrorText = ''.obs;
  //正则表达式
  static const regPhone =
      r"^1(3[0-9]|4[01456879]|5[0-35-9]|6[2567]|7[0-8]|8[0-9]|9[0-35-9])\d{8}$"; //验证11位手机号
  static const regNickName = r"^[\u4E00-\u9FA5A-Za-z0-9]{1,6}$"; //验证1到6位的中英文
  static const regPwd1 =
      r"^[a-zA-Z0-9%&',;=?$/_\\x22]{6,16}$"; //验证6~16位数字、大小写字母
  static const regPwd2 =
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
      nickNameErrorText.value = '请输入1到6位的中英文昵称!';
    } else {
      nickNameErrorText.value = '';
    }
  }

  void rexPwd1() {
    if (pwd1Controller.text == '') {
      pwd1ErrorText.value = '密码不能为空!';
    } else if (!RegExp(regPwd1).hasMatch(pwd1Controller.text)) {
      pwd1ErrorText.value = '密码由6~16位数字、大小写字母组成!';
    } else {
      pwd1ErrorText.value = '';
    }
  }

  void rexPwd2() {
    if (pwd2Controller.text == '') {
      pwd2ErrorText.value = '密码不能为空!';
    } else if (!RegExp(regPwd2).hasMatch(pwd2Controller.text)) {
      pwd2ErrorText.value = '密码由6~16位数字、大小写字母组成!';
    } else if (pwd1Controller.text != pwd2Controller.text) {
      pwd2ErrorText.value = '两次输入的密码不同!';
    }
  }

  //跳转到上传头像的页面
  void toUpPhotoPage() {
    if (RegExp(regPhone).hasMatch(phoneController.text) &&
        RegExp(regNickName).hasMatch(nickNameController.text) &&
        RegExp(regPwd1).hasMatch(pwd1Controller.text) &&
        RegExp(regPwd2).hasMatch(pwd2Controller.text) &&
        pwd1Controller.text == pwd2Controller.text) {
      Get.toNamed('/up_photo');
    } else {
      Get.snackbar(
        '注意哟',
        '请输入注册信息',
        colorText: GlobalColor.c4d6,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //注册按钮
  Future registerApi() async {
    getPhoneValue();
    getPwdValue();
    getPwd2Value();
    getNickValue();
    //开启轻提示toast
    toastInfo(
      msg: 'register...',
      location: ToastGravity.BOTTOM,
    );
    print(111111);
    await usService.register(phoneValue, pwdValue, nickName, avatar);
    // } catch (e) {
    //   print('注册接口错误信息:$e');
    // }
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
    pwd1Focus.addListener(() {
      if (!pwd1Focus.hasFocus) {
        rexPwd1();
      }
    });
    pwd2Focus.addListener(() {
      if (!pwd2Focus.hasFocus) {
        rexPwd2();
      }
    });
    super.onInit();
  }

//销毁控制器
  @override
  void onClose() {
    phoneController.dispose();
    nickNameController.dispose();
    pwd1Controller.dispose();
    pwd2Controller.dispose();
    phoneFocus.dispose();
    nickNameFocus.dispose();
    pwd1Focus.dispose();
    pwd2Focus.dispose();
    super.onClose();
  }
}
