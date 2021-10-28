class MyAccount {
  MyAccount({
    this.code,
    this.data,
    this.msg,
  });

  int? code;
  Data? data;
  String? msg;

  factory MyAccount.fromJson(Map<String, dynamic> json) => MyAccount(
        code: json["code"],
        data: Data.fromJson(json["data"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data!.toJson(),
        "msg": msg,
      };
}

class Data {
  Data({
    this.balance,
  });

  int? balance;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
      };
}
