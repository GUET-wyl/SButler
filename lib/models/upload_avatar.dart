class UploadAvatar {
  UploadAvatar({
    this.avatar,
  });

  String? avatar;

  factory UploadAvatar.fromJson(Map<String, dynamic> json) => UploadAvatar(
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
      };
}
