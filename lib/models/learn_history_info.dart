class LearnHistoryInfo {
  LearnHistoryInfo({
    this.finishCount,
    this.history,
    this.totalCount,
    this.totalEffectiveTime,
  });

  int? finishCount;
  Map<String, Map<String, List<History>>>? history;
  int? totalCount;
  double? totalEffectiveTime;

  factory LearnHistoryInfo.fromJson(Map<String, dynamic> json) =>
      LearnHistoryInfo(
        finishCount: json["finishCount"],
        history: Map.from(json["history"]).map((k, v) =>
            MapEntry<String, Map<String, List<History>>>(
                k,
                Map.from(v).map((k, v) => MapEntry<String, List<History>>(k,
                    List<History>.from(v.map((x) => History.fromJson(x))))))),
        totalCount: json["totalCount"],
        totalEffectiveTime: json["totalEffectiveTime"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "finishCount": finishCount,
        "history": Map.from(history!).map((k, v) => MapEntry<String, dynamic>(
            k,
            Map.from(v).map((k, v) => MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))))),
        "totalCount": totalCount,
        "totalEffectiveTime": totalEffectiveTime,
      };
}

class History {
  History({
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

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        taskName: json["task_name"],
        userId: json["user_id"],
        state: json["state"],
        amount: json["amount"],
        taskDuration: json["task_duration"],
        endTime:
            json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task_name": taskName,
        "user_id": userId,
        "state": state,
        "amount": amount,
        "task_duration": taskDuration,
        "end_time": endTime?.toIso8601String(),
      };
}
