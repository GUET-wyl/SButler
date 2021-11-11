class TotalTaskTime {
  TotalTaskTime({
    this.totalTaskTime,
  });

  int? totalTaskTime;

  factory TotalTaskTime.fromJson(Map<String, dynamic> json) => TotalTaskTime(
        totalTaskTime: json["total_task_time"],
      );

  Map<String, dynamic> toJson() => {
        "total_task_time": totalTaskTime,
      };
}
