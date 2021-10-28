// To parse this JSON data, do
//
//     final learnHistory = learnHistoryFromJson(jsonString);

import 'dart:convert';

LearnHistory learnHistoryFromJson(String str) =>
    LearnHistory.fromJson(json.decode(str));

String learnHistoryToJson(LearnHistory data) => json.encode(data.toJson());

class LearnHistory {
  LearnHistory({
    this.code,
    this.data,
    this.msg,
    this.totalEffectiveCount,
    this.totalStudyCount,
    this.totalStudyTime,
  });

  int? code;
  Map<String, Map<String, List<Datum>>>? data;
  String? msg;
  int? totalEffectiveCount;
  int? totalStudyCount;
  double? totalStudyTime;

  factory LearnHistory.fromJson(Map<String, dynamic> json) => LearnHistory(
        code: json["code"],
        data: Map.from(json["data"]).map((k, v) =>
            MapEntry<String, Map<String, List<Datum>>>(
                k,
                Map.from(v).map((k, v) => MapEntry<String, List<Datum>>(
                    k, List<Datum>.from(v.map((x) => Datum.fromJson(x))))))),
        msg: json["msg"],
        totalEffectiveCount: json["totalEffectiveCount"],
        totalStudyCount: json["totalStudyCount"],
        totalStudyTime: json["totalStudyTime"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(
            k,
            Map.from(v).map((k, v) => MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))))),
        "msg": msg,
        "totalEffectiveCount": totalEffectiveCount,
        "totalStudyCount": totalStudyCount,
        "totalStudyTime": totalStudyTime,
      };
}

class Datum {
  Datum({
    this.id,
    this.taskName,
    this.userId,
    this.state,
    this.amount,
    this.taskDuration,
    this.endTime,
  });

  String? id;
  String? taskName;
  String? userId;
  int? state;
  int? amount;
  int? taskDuration;
  DateTime? endTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        taskName: json["task_name"],
        userId: json["user_id"],
        state: json["state"],
        amount: json["amount"],
        taskDuration: json["task_duration"],
        endTime: DateTime.parse(json["end_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task_name": taskName,
        "user_id": userId,
        "state": state,
        "amount": amount,
        "task_duration": taskDuration,
        "end_time": endTime!.toIso8601String(),
      };
}
