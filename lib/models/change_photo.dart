class ChangePhoto {
  ChangePhoto({
    this.user,
    this.code,
    this.msg,
  });

  User? user;
  int? code;
  String? msg;

  factory ChangePhoto.fromJson(Map<String, dynamic> json) => ChangePhoto(
        user: User.fromJson(json["user"]),
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "user": user!.toJson(),
        "code": code,
        "msg": msg,
      };
}

class User {
  User({
    this.id,
    this.username,
    this.nickname,
    this.avatar,
    this.balance,
  });

  int? id;
  String? username;
  String? nickname;
  String? avatar;
  int? balance;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        nickname: json["nickname"],
        avatar: json["avatar"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nickname": nickname,
        "avatar": avatar,
        "balance": balance,
      };
}
