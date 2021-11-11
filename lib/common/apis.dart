//前端实际传的参数
import 'dart:convert';
import 'package:SButler/common/urls.dart';
import 'package:SButler/models/avatar_info.dart';
import 'package:SButler/models/create_task_info.dart';
import 'package:SButler/models/learn_history_info.dart';
import 'package:SButler/models/login_info.dart';
import 'package:SButler/models/task_detail_info.dart';
import 'package:SButler/models/total_task_time.dart';
import 'package:SButler/models/user_balance.dart';
import 'package:SButler/models/user_info.dart';
import 'package:SButler/utils/http_util.dart';

class ErrorCode {
  static const int SUCCESS = 200;
  static const int TOKEN_ERROR = -1;
}

class Apis {
  //上传头像
  static Future<AvatarInfo> uploadPhoto({
    required file,
  }) {
    return HttpUtil.post(
      Urls.uploadAvatar,
      data: file,
    ).then((value) {
      print('-----上传头像处的value--------$value');
      try {
        AvatarInfo.fromJson(value);
      } catch (e) {
        print('-----上传头像处的Error--------');
      }
      return AvatarInfo.fromJson(value);
    }).catchError(
      (e) => print("上传头像接口处的错误信息:$e"),
    );
  }

  //注册
  static Future<AvatarInfo> register({
    required String username,
    required String password,
    required String nickname,
    String? avatar,
  }) {
    return HttpUtil.post(
      Urls.register,
      data: {
        "username": username,
        "password": password,
        "nickname": nickname,
        "avatar": avatar,
      },
    ).then((value) {
      print('-----注册处的value--------$value');
      try {
        AvatarInfo.fromJson(value);
      } catch (e) {
        print('-----注册处的Error--------');
      }
      return AvatarInfo.fromJson(value);
    }).catchError(
      (e) => print("注册接口处的错误信息:$e"),
    );
  }

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
    }).catchError(
      (e) => print("登录接口处的信息:$e"),
    );
  }

  //退出登录
  static Future<dynamic> logout() {
    return HttpUtil.get(
      Urls.logOut,
    );
  }

//获取用户学习记录
  static Future<LearnHistoryInfo> getStudyHistory() {
    return HttpUtil.get(
      Urls.studyHistory,
    ).then((value) {
      //value是整个接口返回的内容
      print('----获取用户学习记录的value---${json.encode(value)}');
      try {
        LearnHistoryInfo.fromJson(value);
      } catch (e) {
        print('-----获取用户学习记录的Error------$e--');
      }
      return LearnHistoryInfo.fromJson(value);
    }).catchError((e) => print("获取用户学习记录接口处的信息:$e"));
  }

  //获取用户详细信息
  static Future<UserInfo> getUserDetailsInfo() {
    return HttpUtil.get(
      Urls.userInfo,
    ).then((value) {
      //value是整个接口返回的内容
      print('----获取用户详细信息的value---${json.encode(value)}');
      try {
        UserInfo.fromJson(value);
      } catch (e) {
        print('-----获取用户详细信息的Error------$e--');
      }
      return UserInfo.fromJson(value);
    }).catchError((e) => print("获取用户详细信息接口处的信息:$e"));
  }

  //获取用户余额
  static Future<UserBalance> getBalance() {
    return HttpUtil.get(
      Urls.myAccount,
    ).then((value) {
      //value是整个接口返回的内容
      print('----获取用户余额的value---${json.encode(value)}');
      try {
        UserBalance.fromJson(value);
      } catch (e) {
        print('-----获取用户余额的Error------$e--');
      }
      return UserBalance.fromJson(value);
    }).catchError((e) => print("获取用户余额接口处的信息:$e"));
  }

//获取用户总计有效学习时长
  static Future<TotalTaskTime> getUserTotalTaskTime() {
    return HttpUtil.get(
      Urls.totalLearnTime,
    ).then((value) {
      //value是整个接口返回的内容
      print('----获取用户总计有效学习时长的value---${json.encode(value)}');
      try {
        TotalTaskTime.fromJson(value);
      } catch (e) {
        print('-----获取用户总计有效学习时长的Error------$e--');
      }
      return TotalTaskTime.fromJson(value);
    }).catchError((e) => print("获取用户总计有效学习时长接口处的信息:$e"));
  }

  //获取任务明细
  static Future<TaskDetails> getTaskDetails() {
    return HttpUtil.get(
      Urls.taskDetails,
    ).then((value) {
      //value是整个接口返回的内容
      print('----获取任务明细的value---${json.encode(value)}');
      try {
        TaskDetails.fromJson(value);
      } catch (e) {
        print('-----获取任务明细的Error------$e--');
      }
      return TaskDetails.fromJson(value);
    }).catchError((e) => print("获取任务明细接口处的信息:$e"));
  }

  //修改用户昵称
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

  //修改用户头像
  static Future<AvatarInfo> updatePhoto({
    required file,
  }) {
    return HttpUtil.get(
      Urls.updateAvatar,
      data: file,
    ).then((value) {
      print('-----修改用户头像处的value--------$value');
      try {
        AvatarInfo.fromJson(value);
      } catch (e) {
        print('-----修改用户头像处的Error--------');
      }
      return AvatarInfo.fromJson(value);
    }).catchError(
      (e) => print("修改用户头像接口处的错误信息:$e"),
    );
  }

  //创建任务
  static Future<CreateTaskInfo> createTask({
    required String task_name,
    required String task_duration,
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
      print('----创建任务的value---${json.encode(value)}');
      try {
        CreateTaskInfo.fromJson(value);
      } catch (e) {
        print('-----创建任务的Error------$e--');
      }
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

  //上传反馈图片
  static Future<dynamic> uploadFeedPhotos({
    required files,
  }) {
    return HttpUtil.post(
      Urls.uploadFeedPhotos,
      data: files,
    );
  }

  //创建反馈
  static Future<dynamic> createFeedBack({
    required String info,
    // ignore: non_constant_identifier_names
    List? image_url,
  }) {
    return HttpUtil.post(
      Urls.feedback,
      data: {
        "info": info,
        "image_url": image_url,
      },
    );
  }
}
