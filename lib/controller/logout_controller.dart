import 'package:SButler/services/user_info.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  final usService = Get.find<UserInfoService>();
  Future logoutApi() async {
    await usService.logout();
  }
}
