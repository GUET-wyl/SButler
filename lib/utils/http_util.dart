import 'dart:convert';
import 'package:SButler/common/apis.dart';
import 'package:SButler/common/urls.dart';
import 'package:SButler/models/api_response.dart';
import 'package:SButler/services/user_info.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

var dio = Dio();

class HttpUtil {
  HttpUtil._();

  static void init() {
    //1、拦截器
    dio
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ))
      ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options); //continue
        // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
        //
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      }, onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
        // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      }, onError: (DioError e, handler) {
        // Do something with response error
        return handler.next(e); //continue
        // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
      }));

    //2、配置dio实例
    dio.options.baseUrl = Urls.baseUrl;
    dio.options.connectTimeout = 15000; //15s
    dio.options.receiveTimeout = 15000;
  }

  //3、请求头带token
  static Map<String, dynamic> _commonHeader({
    required Map<String, dynamic> header,
  }) {
    header['Content-Type'] = "application/json; charset=utf-8";
    try {
      final usService = Get.find<UserInfoService>();
      var token = usService.getToken();
      print('---------token:$token---------------');
      header['Authorization'] = token;
    } catch (_) {
      print("获取Token失败");
    }

    return header;
  }

  //post请求
  static Future<dynamic> post(
    String url, {
    data,
    Map<String, dynamic>? header,
    bool post = true, //默认post请求
    CancelToken? cancelToken, //取消token
  }) async {
    var headers = _commonHeader(header: header ?? {});
    var resp = dio.post<Map<String, dynamic>>(
      url,
      data: data,
      options: Options(
        headers: headers,
      ),
      cancelToken: cancelToken,
    );
    // todo 显示加载对话框
    return resp.then((val) {
      //val是接口最外层的整个内容
      print('---1、post请求---${val.data?.runtimeType}');
      print('----2、post请求---${json.encode(val.data)}'); //打印整个接口返回的内容
      var resp =
          ApiResponse.fromJson(val.data!); //ApiResponse是接口第一层的那些字段code、data、msg
      if (ErrorCode.SUCCESS == resp.code) {
        // 请求成功
        print('----3、post请求---${json.encode(resp.data)}'); //打印接口中data字段的所有内容
        return resp.data; //data就是第二层开始的那些字段
      } else if (ErrorCode.TOKEN_ERROR == resp.code) {
        // todo token失效，跳转登录页
        // Get.offAllNamed(AppRoutes.LOGIN);
        return Future.error('token invalid');
      } else {
        // 返回api error message
        return Future.error(resp.msg);
      }
    }).catchError((error, stackTrace) {
      // 其他异常
      if (error is DioError) {
        // todo handle exception
      }
      return Future.error(error.toString());
    }).whenComplete(() {
      // todo 隐藏加载对话框
    });
  }

  //get请求
  static Future<dynamic> get(
    String url, {
    data,
    Map<String, dynamic>? header,
    bool get = true, //默认post请求
    CancelToken? cancelToken, //取消请求
  }) async {
    var headers = _commonHeader(header: header ?? {});
    var resp = dio.get<Map<String, dynamic>>(
      url,
      queryParameters: data,
      options: Options(
        headers: headers,
      ),
      cancelToken: cancelToken,
    );
    // todo 显示加载对话框
    return resp.then((val) {
      //val是接口最外层的整个内容
      print('---1、Get请求---${val.data?.runtimeType}');
      print('----2、Get请求---${json.encode(val.data)}'); //打印整个接口返回的内容
      var resp =
          ApiResponse.fromJson(val.data!); //ApiResponse是接口第一层的那些字段code、data、msg
      if (ErrorCode.SUCCESS == resp.code) {
        // 请求成功
        print('----3、Get请求---${json.encode(resp.data)}'); //打印接口中data字段的所有内容
        return resp.data; //data就是第二层开始的那些字段
      } else if (ErrorCode.TOKEN_ERROR == resp.code) {
        // todo token失效，跳转登录页
        // Get.offAllNamed(AppRoutes.LOGIN);
        return Future.error('token invalid');
      } else {
        // 返回api error message
        return Future.error(resp.msg);
      }
    }).catchError((error, stackTrace) {
      // 其他异常
      if (error is DioError) {
        // todo handle exception
      }
      return Future.error(error.toString());
    }).whenComplete(() {
      // todo 隐藏加载对话框
    });
  }
}
