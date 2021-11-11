class AvatarInfo {
  AvatarInfo({
    this.avatar,
  });

  String? avatar;

  factory AvatarInfo.fromJson(Map<String, dynamic> json) => AvatarInfo(
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
      };
}
