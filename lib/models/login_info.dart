class LoginInfo {
  LoginInfo({
    this.avatar,
    this.balance,
    this.nickname,
    this.token,
    this.username,
  });

  String? avatar;
  int? balance;
  String? nickname;
  String? token;
  String? username;

  factory LoginInfo.fromJson(Map<String, dynamic> json) => LoginInfo(
        avatar: json["avatar"],
        balance: json["balance"],
        nickname: json["nickname"],
        token: json["token"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "balance": balance,
        "nickname": nickname,
        "token": token,
        "username": username,
      };
}
