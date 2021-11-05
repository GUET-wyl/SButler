import 'package:SButler/common/apis.dart';
import 'package:SButler/routes/app_pages.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class TaskController extends GetxController {
  final usService = Get.find<UserInfoService>();
  late Timer timer;
  var currentTimer = 30.obs; //动态设置初始值

  var taskName; //任务名称
  var taskTime; //任务时间
  var taskMoney; //任务金额
  var res; //传给后台的任务时间值（当timeList不是最后一个元素时）
  //文本控制器
  TextEditingController taskTextController = TextEditingController();
  TextEditingController taskTimeController = TextEditingController();
  TextEditingController taskMoneyController = TextEditingController();
  //焦点控制器
  var taskTextFocus = FocusNode();
  var taskTimeFocus = FocusNode();
  var taskMoneyFocus = FocusNode();
  //获取任务名称
  getTaskText() {
    taskName = taskTextController.text;
    print('任务名称为:$taskName');
  }

  //获取自定义的任务时间
  getTaskTime() {
    taskTime = taskTimeController.text;
    print('自定义的任务时间为:$taskTime');
  }

  //获取自定义的任务金额
  getTaskMoney() {
    taskMoney = taskMoneyController.text;
    print('自定义的任务金币为:$taskMoney');
  }

  var currentIndex = 0.obs; //当前选中的任务时间按钮对象的下标
  List<String> timeList = [
    '0.5',
    '1',
    '2',
    '自定义',
  ].obs;
  //点击切换不同的任务时间按钮
  onItemTap(int index) {
    if (currentIndex.value != index) {
      currentIndex.value = index;
    }
  }

  //3、任务金额
  var crtIndex = 0.obs; //当前选中的任务金额按钮对象的下标
  List<String> moneyList = ['5', '20', '88', '100', '200', '自定义'].obs;
  //点击切换不同的任务金额按钮
  toggleMoney(int idx) {
    if (crtIndex.value != idx) {
      crtIndex.value = idx;
    }
    // if (moneyList.elementAt(idx) == '自定义') {
    //   return Dialog();
    // }
  }

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
    taskTimeController.dispose();
    taskTextFocus.dispose();
    taskTimeFocus.dispose();
    super.onClose();
  }
}
