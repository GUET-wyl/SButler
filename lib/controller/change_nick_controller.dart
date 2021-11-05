import 'package:SButler/services/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeNickNameController extends GetxController {
  final usService = Get.find<UserInfoService>();
  var nickName; //昵称名
  //获取昵称
  getNickNameValue() {
    nickName = nickNameController.text;
    print('昵称为:$nickName');
  }

  //文本控制器
  TextEditingController nickNameController = TextEditingController();
  //焦点控制器
  var nickNameFocus = FocusNode();
  //错误提示文本
  var nickNameErrorText = ''.obs;
  //正则表达式
  static const regNickName = r"^[\u4E00-\u9FA5A-Za-z0-9]{1,6}$"; //验证1到6位的中英文
  //非空判断、错误文本提示
  void rexNickName() {
    if (nickNameController.text == '') {
      nickNameErrorText.value = '昵称不能为空!';
    } else if (!RegExp(regNickName).hasMatch(nickNameController.text)) {
      nickNameErrorText.value = '请输入1到10位的中英文昵称!';
    } else {
      nickNameErrorText.value = '';
    }
  }

  void changeNicknameApi() async {
    try {
      getNickNameValue();
      if (RegExp(regNickName).hasMatch(nickNameController.text)) {
        await usService.changeNickName(nickName);
      }
    } catch (e) {
      print('修改昵称的接口信息:$e');
    }
  }

//开启监听输入框是否有值
  @override
  void onInit() {
    nickNameFocus.addListener(() {
      if (!nickNameFocus.hasFocus) {
        rexNickName();
      }
    });
    super.onInit();
  }

//销毁控制器
  @override
  void onClose() {
    nickNameFocus;
    nickNameController.dispose();
    super.onClose();
  }
}
