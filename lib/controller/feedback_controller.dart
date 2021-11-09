import 'package:SButler/global/public.dart';
import 'package:SButler/services/user_info.dart';
import 'package:SButler/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:SButler/common/apis.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class FeedBackController extends GetxController {
  final usService = Get.find<UserInfoService>();

  List imgfiles = [];
  List img = [].obs;
  var imgUrl = '';

  var feedText; //反馈的内容
  //文本控制器
  TextEditingController feedTextController = TextEditingController();
  //获取反馈的内容
  getFeedText() {
    feedText = feedTextController.text;
    print('反馈的内容为:$feedText');
  }

  //焦点控制器
  var feedTextFocus = FocusNode();
  //错误提示文本
  var feedErrorText = ''.obs;
  //非空判断、错误文本提示
  void reFeedText() {
    if (feedTextController.text == '') {
      feedErrorText.value = '反馈内容不能为空!';
    } else {
      feedErrorText.value = '';
    }
  }

//删除选中的图片
  deleteImage(index) {
    print(12);
    img.removeAt(index);
  }

//选择多张图片
  void getImage() async {
    List<XFile>? imgsList = await ImagePicker().pickMultiImage();
    if (imgsList != null) {
      for (var element in imgsList) {
        imgUrl = element.path;
        img.add(imgUrl);
      }
      uploadFeedPhoto();
    }
  }

//上传反馈图片(可以选择多张图片)
  Future uploadFeedPhoto() async {
    try {
      dio.FormData formData = dio.FormData.fromMap({
        "files": img.map((e) {
          return dio.MultipartFile.fromFileSync(e);
        }).toList(),
      });
      usService.saveLoginInfo; //取token
      if ((usService.loginInfo?.token ?? "").isNotEmpty) {
        var result = await Apis.uploadFeedPhotos(files: formData);
        print('-----上传的反馈图片------$result');
        imgfiles = result;
      }
    } catch (e) {
      print('e:$e');
    }
  }

  //创建反馈
  Future createFeeds() async {
    getFeedText();
    if (feedText == '') {
      Get.snackbar(
        '注意哟',
        '反馈内容不能为空！',
        colorText: GlobalColor.cfa.withOpacity(.8),
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      toastInfo(
        msg: '意见反馈正在提交中...',
        location: ToastGravity.BOTTOM,
      );
      var res = await Apis.createFeedBack(
        info: feedText,
        image_url: imgfiles,
      );
      if (res == null) {
        Fluttertoast.cancel();
        Get.back();
      }
    }
  }

//开启监听输入框是否有值
  @override
  void onInit() {
    super.onInit();
  }

//销毁控制器
  @override
  void onClose() {
    feedTextController.dispose();
    feedTextFocus.dispose();
    super.onClose();
  }
}
