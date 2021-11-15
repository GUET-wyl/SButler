class TotalTaskTime {
  TotalTaskTime({
    this.total_task_time,
  });

  int? total_task_time;

  factory TotalTaskTime.fromJson(Map<String, dynamic> json) => TotalTaskTime(
        total_task_time: json["total_task_time"],
      );

  Map<String, dynamic> toJson() => {
        "total_task_time": total_task_time,
      };
}
