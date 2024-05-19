class UserModel {
  final String userName;
  final String avatar;

  UserModel({
    required this.userName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['login'],
      avatar: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "login": userName,
      "avatar_url": avatar,
    };
  }
}
