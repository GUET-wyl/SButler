class TotalLearnTime {
  TotalLearnTime({
    this.code,
    this.msg,
    this.data,
  });

  int? code;
  String? msg;
  Data? data;

  factory TotalLearnTime.fromJson(Map<String, dynamic> json) => TotalLearnTime(
        code: json["code"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.totalTaskTime,
  });

  int? totalTaskTime;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalTaskTime: json["total_task_time"],
      );

  Map<String, dynamic> toJson() => {
        "total_task_time": totalTaskTime,
      };
}
