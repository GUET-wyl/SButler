import 'package:SButler/common/apis.dart';
import 'package:SButler/global/public.dart';
import 'package:SButler/models/create_task_info.dart';
import 'package:SButler/routes/app_pages.dart';
import 'package:SButler/utils/persistence_util.dart';
import 'package:get/get.dart';
import 'dart:async';

class TaskController extends GetxController {
  late Timer timer;
  var currentTimer = 30.obs; //动态设置初始值
  //创建并开始专注任务
  // startTask() {
  //   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (currentTimer == 0) {
  //       //停止计时，去专注成功页面
  //       timer.cancel();
  //       Get.toNamed('/success_result');
  //       return;
  //     }
  //     currentTimer--;
  //     //每间隔1秒回调一下
  //   });
  // }
  void createTaskApi() async {
    var task_name;
    var task_duration;
    var amount;
    CreateTaskInfo result = await Apis.createTask(
      task_name: task_name,
      task_duration: task_duration,
      amount: amount,
    );
    if (result != null) {
      Get.toNamed(
        AppRoutes.HOME,
      );
    }
  }

  void finishTaskApi() async {
    //退出登录api
    var id; //创建任务传递过来的值
    var result = await Apis.finishTask(id: id);
    if (result != null) {
      Get.toNamed(
        AppRoutes.FAIL_RESULT,
      );
    }
  }

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentTimer == 0) {
        //停止计时，去专注成功页面
        timer.cancel();
        Get.toNamed('/success_result');
        return;
      }
      currentTimer--;
      //每间隔1秒回调一下
    });
    super.onInit();
  }

  @override
  void onClose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.onClose();
  }
}
