//前端必传的字段
import 'dart:convert';
import 'package:SButler/common/urls.dart';
import 'package:SButler/models/create_task_info.dart';
import 'package:SButler/models/login_info.dart';
import 'package:SButler/models/upload_avatar.dart';
import 'package:SButler/utils/http_util.dart';

class ErrorCode {
  static const int SUCCESS = 200;
  static const int TOKEN_ERROR = -1;
}

class Apis {
  //登录
  static Future<LoginInfo> login({
    required String username,
    required String password,
  }) {
    return HttpUtil.post(
      Urls.login,
      data: {
        "username": username,
        "password": password,
      },
    ).then((value) {
      //value是整个接口中返回的data字段的所有内容
      var res = json.encode(value);
      print('----res的内容---${json.encode(value)}');
      return LoginInfo.fromJson(value);
    }).catchError((e) => print("登录接口处的信息:$e"));
  }

  //上传头像
  static Future<UploadAvatar> upPhoto({
    required file,
  }) {
    return HttpUtil.post(
      Urls.uploadAvatar,
      data: file,
    ).then((value) {
      return UploadAvatar.fromJson(value);
    }).catchError((e) => print("上传头像接口处的信息:$e"));
  }

  //注册
  static Future<dynamic> register({
    required String username,
    required String password,
    required String nickname,
  }) {
    return HttpUtil.post(
      Urls.register,
      data: {
        "username": username,
        "password": password,
        "nickname": nickname,
      },
    );
  }

  //退出登录
  static Future<dynamic> logout() {
    return HttpUtil.get(
      Urls.logOut,
    );
  }

  //修改昵称
  static Future<dynamic> changeNickname({
    required String nickname,
  }) {
    return HttpUtil.post(
      Urls.updateNickname,
      data: {
        "nickname": nickname,
      },
    );
  }

  //创建任务
  static Future<CreateTaskInfo> createTask({
    required String task_name,
    required int task_duration,
    required int amount,
  }) {
    return HttpUtil.post(
      Urls.createTask,
      data: {
        "task_name": task_name,
        "task_duration": task_duration,
        "amount": amount,
      },
    ).then((value) {
      //value是整个接口返回的内容
      print('----value的内容---${json.encode(value)}');
      return CreateTaskInfo.fromJson(value);
    }).catchError((e) => print("创建任务接口处的信息:$e"));
  }

  //结束任务
  static Future<dynamic> finishTask({
    required String id,
  }) {
    return HttpUtil.post(
      Urls.finishTask,
      data: {
        "id": id,
      },
    );
  }
}
