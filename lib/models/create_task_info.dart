class CreateTaskInfo {
  CreateTaskInfo({
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

  factory CreateTaskInfo.fromJson(Map<String, dynamic> json) => CreateTaskInfo(
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
