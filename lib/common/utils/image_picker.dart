import 'dart:io';
import 'package:SButler/common/global/public.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerPage> {
  // 用户本地的图片文件
  File? _image; //存放获取到的本地路径
  // 实例化选择图片
  final picker = ImagePicker();
  // 获取本地图片
  Future getImage() async {
    final pickedFile = await picker.pickImage(
      // 手机选择图库
      source: ImageSource.gallery,
      // 图片的尺寸
      maxWidth: 110.w,
      maxHeight: 110.w,
    );
    // 更新图片状态
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        // 上传图片到服务器
        uploadImg(pickedFile.path);
      } else {
        print('没有选择任何图片');
      }
    });
  }

  //异步吊起相机拍摄新照片方法
  Future getCameraImage() async {
    final cameraImages = await picker.pickImage(
      source: ImageSource.camera,
      // 图片的尺寸
      maxWidth: 110.w,
      maxHeight: 110.w,
    );
    //更改图片状态
    setState(() {
      //拍摄照片不为空
      if (cameraImages != null) {
        _image = File(cameraImages.path);
        print('你选择的路径是：${_image.toString()}');
        //图片为空
      } else {
        print('没有拍摄照片');
      }
    });
  }

  var dio = Dio();
  // 上传图片的方法
  void uploadImg(imageUrl) async {
    FormData formData = FormData.fromMap({
      "name": "admin",
      "password": 123456,
      "file": await MultipartFile.fromFile(imageUrl, filename: "avatar.img")
    });
    var result =
        await dio.post("http://js.itying.com/imgupload", data: formData);
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0.w,
            right: 0.w,
            bottom: 0.w,
            height: 164.w,
            child: Container(
              decoration: BoxDecoration(
                color: GlobalColor.bgColor2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.w),
                    topRight: Radius.circular(20.w)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Center(
                  //   child: _image == null ? Text('没有选择任何图片') : Image.file(_image!),
                  // ),
                  GestureDetector(
                    onTap: () {
                      getCameraImage();
                      print('拍照上传');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 15.h,
                        bottom: 15.h,
                      ),
                      child: Text(
                        '拍照上传',
                        style: TextStyle(
                          fontSize: 16.w,
                          color: GlobalColor.titleColor,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Divider(
                    height: 1,
                    color: GlobalColor.dividColor,
                  ),

                  GestureDetector(
                    onTap: () {
                      getImage();
                      print('从相册中选择');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 14.h,
                        bottom: 15.h,
                      ),
                      child: Text(
                        '从相册中选择',
                        style: TextStyle(
                          fontSize: 16.w,
                          color: GlobalColor.titleColor,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    height: 9.w,
                    color: GlobalColor.bgColor3,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('取消');
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 15.h,
                        bottom: 14.h,
                      ),
                      child: Text(
                        '取消',
                        style: TextStyle(
                          fontSize: 16.w,
                          color: GlobalColor.titleColor,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
