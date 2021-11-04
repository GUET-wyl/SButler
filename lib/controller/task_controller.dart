import 'package:SButler/common/apis.dart';
import 'package:SButler/routes/app_pages.dart';
import 'package:SButler/services/user_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class TaskController extends GetxController {
  final usService = Get.find<UserInfoService>();
  late Timer timer;
  var currentTimer = 30.obs; //动态设置初始值

  var isChoiced = true; //是否选中某个任务时间
  var ifChoiced = true; //是否选中某个任务金币
  var currentIndex = 0.obs; //当前选中的任务时间按钮对象的下标
  List<String> timeList = [
    '0.5小时',
    '1小时',
    '2小时',
    '自定义',
  ];
  List<String> moneyList = ['5金币', '20金币', '88金币', '100金币', '200金币', '自定义'];

  var taskName; //任务名称
  //文本控制器
  TextEditingController taskTextController = TextEditingController();
  //获取任务名称
  getTaskText() {
    taskName = taskTextController.text;
    print('任务名称为:$taskName');
  }

  //点击切换不同的任务时间按钮
  onItemTap(int index) {
    if (currentIndex.value != index) {
      currentIndex.value = index;
    }
  }

  //焦点控制器
  var taskTextFocus = FocusNode();
  //创建任务
  // void createTaskApi() async {
  //   await usService.createTask(taskName, taskTime, taskAmount);
  // }

  //结束任务
  // void finishTaskApi(String id) async {
  //   var result = await Apis.finishTask(id: id);
  //   if (result != null) {
  //     Get.toNamed(
  //       AppRoutes.FAIL_RESULT,
  //     );
  //   }
  // }

  @override
  void onInit() {
    // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   // ignore: unrelated_type_equality_checks
    //   if (currentTimer == 0) {
    //     //停止计时，去专注成功页面
    //     timer.cancel();
    //     Get.toNamed('/success_result');
    //     return;
    //   }
    //   currentTimer--;
    //   //每间隔1秒回调一下
    // });
    super.onInit();
  }

  @override
  void onClose() {
    // if (timer.isActive) {
    //   timer.cancel();
    // }
    taskTextController.dispose();
    taskTextFocus.dispose();
    super.onClose();
  }
}
