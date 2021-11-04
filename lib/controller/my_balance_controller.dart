import 'package:SButler/services/user_info.dart';
import 'package:get/get.dart';

class GetBalanceController extends GetxController {
  final usService = Get.find<UserInfoService>();
  var bal = 0.obs; //余额

//开启监听输入框是否有值
  @override
  void onInit() {
    super.onInit();
  }

//销毁控制器
  @override
  void onClose() {
    super.onClose();
  }
}
