// 用户信息的本地存储service
import 'package:SButler/common/apis.dart';
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
  var userPhoto; //用户注册流程中上传的头像
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
  LoginInfo? removeLocalLoginInfo(String? token) {
    spService.prefs.remove((userInfoKey));
  }

  //初始化时，获取用户的所有登录接口信息
  Future<UserInfoService> init() async {
    loginInfo = getLocalLoginInfo();
    return this;
  }

//upload userAvatar
  uploadUserAvatar(file) async {
    var result = await Apis.uploadPhoto(file: file);
    if (result != null) {
      userPhoto = result.avatar;
      Get.back();
    } else {
      Get.snackbar(
        '',
        '头像上传成功！',
        duration: const Duration(seconds: 3),
        colorText: GlobalColor.c3f,
      );
    }
  }

  //resgister
  register(
    String phoneValue,
    String pwdValue,
    String nickName,
    String? avatar,
  ) async {
    var result = await Apis.register(
      username: phoneValue,
      password: pwdValue,
      nickname: nickName,
      avatar: userPhoto, //这里注册接口才能拿到上传头像接口传递过来的用户头像avatar!!!
    );
    if (result != null) {
      Fluttertoast.cancel();
      print('---注册头像字段-----${result.avatar}');
      loginInfo!.avatar = result.avatar;
      Get.toNamed(
        AppRoutes.LOGIN,
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
    // ignore: unnecessary_null_comparison
    if (result != null) {
      Fluttertoast.cancel();
      Get.toNamed(
        AppRoutes.HOME,
      );
      loginInfo = result;
      saveLoginInfo(loginInfo!); //存储用户信息
      print('---登录页存储的token值：----${result.token}');
    } else {
      Get.snackbar(
        '',
        '请先去进行注册！',
        duration: const Duration(seconds: 3),
        colorText: GlobalColor.c3f,
      );
    }
  }

  //change userAvatar
  changeUserAvatar(file) async {
    var result = await Apis.updatePhoto(file: file);
    if (result != null) {
      print('-----修改后的用户头像-------${result.avatar}');
      loginInfo?.avatar = result.avatar;
      Get.toNamed('/home');
    } else {
      Get.snackbar(
        '',
        '头像修改成功！',
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
      print('-----修改后的昵称-------$nickName');
      loginInfo?.nickname = nickName;
      Get.toNamed(
        AppRoutes.HOME,
      );
    } else {
      Get.snackbar(
        '',
        '昵称修改成功！',
        duration: const Duration(seconds: 3),
        colorText: GlobalColor.c3f,
      );
    }
  }

//创建任务api
  void createTask(String taskName, int res1, int res2) async {
    var result = await Apis.createTask(
      task_name: taskName,
      task_duration: res1,
      amount: res2,
    );
    if (result != null) {
      print('----------创建任务api---------$result');
      loginInfo?.task_name = taskName;
      loginInfo?.task_duration = res1;
      loginInfo?.amount = res2;
      Get.toNamed(
        AppRoutes.FINISH_TASK,
      );
    }
  }

  //获取用户余额
  getUserBalance() async {
    var result = await Apis.getBalance();
    print('----获取用户余额-----${result["balance"]}');
    loginInfo?.balance = result["balance"]; //真正的余额
    if (result != null) {
      Get.toNamed(
        AppRoutes.MY_ACCOUNT,
      );
    }
  }

  //获取用户学习记录----流程能走通，目前没有任务内容
  getUserStudyHistory() async {
    var result = await Apis.getStudyHistory();
    print('----获取用户学习记录-----$result');
    //----获取用户学习记录-----{}
    loginInfo?.balance = result["balance"]; //真正的余额
    if (result != null) {
      Get.toNamed(
        AppRoutes.LEARN_RECORDS,
      );
    }
  }

  //获取用户余额
  getUserBalanceApi() async {
    var result = await Apis.getBalance();
    print('----获取用户余额-----${result["balance"]}');
    loginInfo?.balance = result["balance"]; //真正的余额
    if (result != null) {
      Get.toNamed(
        AppRoutes.MY_ACCOUNT,
      );
    }
  }

  //获取任务明细----流程能走通，目前没有任务内容
  getTaskDetailsApi() async {
    var result = await Apis.getTaskDetails();
    print('-----获取任务明细----$result');
    //-----获取任务明细----{tasks: []}
    if (result != null) {
      Get.toNamed(
        AppRoutes.TASK_DETAILS,
      );
    }
  }

  //退出登录
  logout() async {
    try {
      var result = await Apis.logout();
      if (result != null) {
        removeLocalLoginInfo(loginInfo!.token); //删除用户的token
        Get.offAllNamed(
          AppRoutes.LOGIN,
        );
      }
    } catch (e) {
      Get.offAllNamed(
        AppRoutes.LOGIN,
      );
    }
  }
}
