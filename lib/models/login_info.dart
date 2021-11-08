class LoginInfo {
  LoginInfo({
    this.avatar,
    this.balance,
    this.password,
    this.nickname,
    this.token,
    this.username,
    this.id,
    this.task_name,
    this.user_id,
    this.state,
    this.amount,
    this.task_duration,
    this.end_time,
  });

  String? avatar;
  int? balance;
  String? password;
  String? nickname;
  String? token;
  String? username;
  String? id;
  String? task_name;
  String? user_id;
  int? state;
  int? amount;
  int? task_duration;
  DateTime? end_time;

  factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
        avatar: json["avatar"],
        balance: json["balance"],
        password: json["password"],
        nickname: json["nickname"],
        token: json["token"],
        username: json["username"],
        id: json["id"],
        task_name: json["task_name"],
        user_id: json["user_id"],
        state: json["state"],
        amount: json["amount"],
        task_duration: json["task_duration"],
        end_time:
            json["end_time"] == null ? null : DateTime.parse(json["end_time"]),
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "balance": balance,
        "password": password,
        "nickname": nickname,
        "token": token,
        "username": username,
        "id": id,
        "task_name": task_name,
        "user_id": user_id,
        "state": state,
        "amount": amount,
        "task_duration": task_duration,
        "end_time": end_time?.toIso8601String(),
      };
}
