//接口响应回的字段
class ApiResponse {
  int code;
  String msg;
  dynamic data;

  ApiResponse.fromJson(Map<String, dynamic> map)
      : code = map["code"],
        msg = map["msg"],
        data = map["data"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['data'] = data;
    return data;
  }
}
