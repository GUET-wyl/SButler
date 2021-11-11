class UserBalance {
  UserBalance({
    this.balance,
  });

  int? balance;

  factory UserBalance.fromJson(Map<String, dynamic> json) => UserBalance(
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
      };
}
