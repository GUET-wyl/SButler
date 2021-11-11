import 'package:SButler/common/apis.dart';
import 'package:SButler/global/color.dart';
import 'package:SButler/routes/app_pages.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:async';

class TaskController extends GetxController {
  final usService = Get.find<UserInfoService>();
  late Timer timer;
  var currentTimer = 30.obs; //动态设置初始值

  var taskName; //任务名称
  var taskTime; //任务时间
  var taskMoney; //任务金额
  String res1 = '0.5'; //传给后台的任务时间值（当timeList不是最后一个元素时）
  int res2 = 5; //传给后台的任务金币值（当moneyList不是最后一个元素时）
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

  //获取任务时间
  getTaskTime() {
    print('-----任务时间为:----$res1');
  }

  //获取任务金币
  getTaskMoney() {
    print('-----任务金币为:------$res2');
  }

  //获取自定义的任务时间
  getSelfTaskTime() {
    taskTime = taskTimeController.text;
    print('自定义的任务时间为:$taskTime');
  }

  //获取自定义的任务金额
  getSelfTaskMoney() {
    taskMoney = taskMoneyController.text;
    print('自定义的任务金币为:$taskMoney');
  }

  //2、任务时间
  var currentIndex = 0.obs; //当前选中的任务时间按钮对象的下标
  var timeErrorText = ''.obs; //自定义的任务时间的错误提示文本
  //正则表达式
  static const regTime = r"^0\.[5-9]$|^[1-2]\.\d$|^[1-3]$"; //验证0.5-3小时的任务时间
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

  //非空判断、错误文本提示
  void rexTime() {
    if (taskTime == null) {
      timeErrorText.value = '自定义的专注时间不能为空!';
    } else if (!RegExp(regTime).hasMatch(taskTime)) {
      timeErrorText.value = '请输入0.5到3的专注时间';
    } else {
      timeErrorText.value = '';
    }
  }

  //3、任务金额
  var crtIndex = 0.obs; //当前选中的任务金额按钮对象的下标
  var moneyErrorText = ''.obs; //自定义的任务金额的错误提示文本
  //正则表达式
  static const regMoney =
      r"^[5-9]$|^[1-4]\d\d$|^500$|^[1-9]\d$"; //验证5-500金币的任务金币
  List<String> moneyList = ['5', '20', '88', '100', '200', '自定义'].obs;
  //点击切换不同的任务金额按钮
  toggleMoney(int idx) {
    if (crtIndex.value != idx) {
      crtIndex.value = idx;
    }
  }

  //错误文本提示
  void rexMoney() {
    if (!RegExp(regMoney).hasMatch(taskMoney)) {
      moneyErrorText.value = '请输入5到500的挑战金';
    } else {
      moneyErrorText.value = '';
    }
  }

  //创建任务api
  void createTaskApi() {
    getTaskText();
    getTaskTime();
    getTaskMoney();
    getSelfTaskTime();
    getSelfTaskMoney();
    if (taskName == '') {
      return Get.snackbar(
        '注意哟',
        '任务名称不能为空！',
        colorText: GlobalColor.c4d6,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      usService.createTask(taskName, res1, res2);
    }
  }

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
    // taskTimeFocus.addListener(() {
    //   if (!taskTimeFocus.hasFocus) {
    //     rexTime();
    //   }
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
