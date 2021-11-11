class TaskDetails {
  TaskDetails({
    this.tasks,
  });

  List<Task>? tasks;

  factory TaskDetails.fromJson(Map<String, dynamic> json) => TaskDetails(
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tasks": tasks == null
            ? null
            : List<dynamic>.from(tasks!.map((x) => x.toJson())),
      };
}

class Task {
  Task({
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
  dynamic endTime;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        taskName: json["task_name"],
        userId: json["user_id"],
        state: json["state"],
        amount: json["amount"],
        taskDuration: json["task_duration"],
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task_name": taskName,
        "user_id": userId,
        "state": state,
        "amount": amount,
        "task_duration": taskDuration,
        "end_time": endTime,
      };
}
