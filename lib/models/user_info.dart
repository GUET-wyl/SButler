class UserInfo {
  UserInfo({
    this.id,
    this.username,
    this.nickname,
    this.avatar,
    this.balance,
  });

  String? id;
  String? username;
  String? nickname;
  String? avatar;
  int? balance;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
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
