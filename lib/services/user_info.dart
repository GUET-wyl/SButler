// 用户信息service

import 'package:SButler/common/apis.dart';
import 'package:SButler/controller/register_controller.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/models/login_info.dart';
import 'package:SButler/routes/app_pages.dart';
import 'package:SButler/services/share_prefers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

class UserInfoService extends GetxService {
  LoginInfo? loginInfo;
  static const userInfoKey = "LocalKey_UserInfo";
  final spService = Get.find<SharePreferencesService>();
  final RegisterController rc = Get.put(RegisterController());

  // 获取token
  String getToken() {
    return loginInfo?.token ?? "";
  }

  //存本地info
  saveLoginInfo(LoginInfo loginInfo) async {
    spService.prefs
        .setString(userInfoKey, convert.jsonEncode(loginInfo.toJson()));
  }

  //取本地的info
  LoginInfo? getLocalLoginInfo() {
    var jsonString = spService.prefs.getString(userInfoKey);
    if (jsonString != null) {
      // 说明本地是有数据的
      return LoginInfo.fromJson(convert.jsonDecode(jsonString));
    }
    return null;
  }

  //删本地info
  LoginInfo? removeLocalLoginInfo() {
    spService.prefs.remove((userInfoKey));
  }

  //初始化时，获取用户的所有登录接口信息
  Future<UserInfoService> init() async {
    loginInfo = getLocalLoginInfo();
    return this;
  }

  //resgister
  register(String phoneValue, String pwdValue, String nickName) async {
    var result = await Apis.register(
      username: phoneValue,
      password: pwdValue,
      nickname: nickName,
    );
    if (result == null) {
      //需要把result.avatar拿去把注册接口的avatar字段值给替换掉
      loginInfo?.avatar = rc.firstAvatar;
      Fluttertoast.cancel();
      Get.toNamed(
        AppRoutes.UP_PHOTO,
      );
    } else {
      Get.snackbar(
        '',
        '该账号已被注册！',
        duration: const Duration(seconds: 3),
        colorText: GlobalColor.c3f,
      );
    }
  }

  //login
  login(String phoneValue, String pwdValue) async {
    LoginInfo result = await Apis.login(
      username: phoneValue,
      password: pwdValue,
    );
    if (result != null) {
      Fluttertoast.cancel();
      Get.toNamed(
        AppRoutes.HOME,
      );
      loginInfo = result;
    } else {
      Get.snackbar(
        '',
        '请先去进行注册！',
        duration: const Duration(seconds: 3),
        colorText: GlobalColor.c3f,
      );
    }
  }

//change nickname
  changeNickName(String nickName) async {
    var result = await Apis.changeNickname(
      nickname: nickName,
    );
    if (result != null) {
      //1、接口返回的信息中没有data字段中的avatar字段
      print('-----修改后的昵称-------$nickName');
      //把修改后的昵称赋值给抽屉处的nickName==>重写nickName的值
      loginInfo?.nickname = nickName;
      Get.toNamed(
        AppRoutes.HOME,
      );
    } else {
      //2、接口返回的信息中没有data字段中的avatar字段
      Get.snackbar(
        '',
        '昵称修改成功！',
        duration: const Duration(seconds: 3),
        colorText: GlobalColor.c3f,
      );
    }
  }

  //logout
  logout() async {
    var result = await Apis.logout();
    if (result != null) {
      Get.toNamed(
        AppRoutes.INDEX,
      );
    }
  }
}
