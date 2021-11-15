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
    this.task_name,
    this.user_id,
    this.state,
    this.amount,
    this.task_duration,
    this.end_time,
  });

  String? id;
  String? task_name;
  String? user_id;
  int? state;
  int? amount;
  int? task_duration;
  dynamic end_time;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        task_name: json["task_name"],
        user_id: json["user_id"],
        state: json["state"],
        amount: json["amount"],
        task_duration: json["task_duration"],
        end_time: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task_name": task_name,
        "user_id": user_id,
        "state": state,
        "amount": amount,
        "task_duration": task_duration,
        "end_time": end_time,
      };
}
