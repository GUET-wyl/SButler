// To parse this JSON data, do
//
//     final finishTask = finishTaskFromJson(jsonString);

import 'dart:convert';

FinishTask finishTaskFromJson(String str) =>
    FinishTask.fromJson(json.decode(str));

String finishTaskToJson(FinishTask data) => json.encode(data.toJson());

class FinishTask {
  FinishTask({
    this.code,
    this.data,
    this.msg,
  });

  int? code;
  Data? data;
  String? msg;

  factory FinishTask.fromJson(Map<String, dynamic> json) => FinishTask(
        code: json["code"],
        data: Data.fromJson(json["data"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data!.toJson(),
        "msg": msg,
      };
}

class Data {
  Data({
    this.amount,
    this.id,
    this.state,
    this.taskDuration,
    this.taskName,
  });

  int? amount;
  String? id;
  int? state;
  int? taskDuration;
  String? taskName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        amount: json["amount"],
        id: json["id"],
        state: json["state"],
        taskDuration: json["task_duration"],
        taskName: json["task_name"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "id": id,
        "state": state,
        "task_duration": taskDuration,
        "task_name": taskName,
      };
}
