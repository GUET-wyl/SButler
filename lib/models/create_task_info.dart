class CreateTaskInfo {
  CreateTaskInfo({
    this.task_name,
    this.amount,
    this.task_duration,
  });

  String? task_name;

  int? amount;
  String? task_duration;

  factory CreateTaskInfo.fromJson(Map<String, dynamic> json) => CreateTaskInfo(
        task_name: json["task_name"],
        amount: json["amount"],
        task_duration: json["task_duration"],
      );

  Map<String, dynamic> toJson() => {
        "task_name": task_name,
        "amount": amount,
        "task_duration": task_duration,
      };
}
