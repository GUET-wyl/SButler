//image_picker组件
import 'package:SButler/services/user_info.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';

final usService = Get.find<UserInfoService>();
var selectedImagePath1 = ''.obs; //上传用户头像
var selectedImagePath2 = ''.obs; //修改用户头像
//上传用户头像
void uploadImage(ImageSource imageSource) async {
  final pickedFile = await ImagePicker().pickImage(source: imageSource);
  if (pickedFile != null) {
    selectedImagePath1.value = pickedFile.path;
    uploadImg(); //调用上传头像的接口
  }
}

void uploadImg() async {
  dio.FormData formData = dio.FormData.fromMap({
    "file": await dio.MultipartFile.fromFile(
      selectedImagePath1.value,
      filename: "avatar.png", //只是一个图片的格式，占位而已
    ),
  });
  await usService.uploadUserAvatar(formData);
}

//修改用户头像
void changeImage(ImageSource imageSource) async {
  final pickedFile = await ImagePicker().pickImage(source: imageSource);
  if (pickedFile != null) {
    selectedImagePath2.value = pickedFile.path;
    changeImg(); //调用修改头像的接口
  }
}

void changeImg() async {
  dio.FormData formData = dio.FormData.fromMap({
    "file": await dio.MultipartFile.fromFile(
      selectedImagePath2.value,
      filename: "avatar.png", //只是一个图片的格式，占位而已
    ),
  });
  await usService.changeUserAvatar(formData);
}
