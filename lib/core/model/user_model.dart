typedef Json = Map<String, dynamic>;

class User {
  final String name;
  final String username;
  final String avatar;
  final int followers;
  final int following;

  User({
    required this.name,
    required this.username,
    required this.avatar,
    required this.followers,
    required this.following,
  });

  factory User.fromJson(Json json) {
    return User(
      avatar: json['avatar_url'],
      username: json['login'],
      name: json['name'],
      followers: json['followers'],
      following: json['following'],
    );
  }

  // Json toJson() {
  //   return {'avatar_url': avatar, 'login': username, 'name': name};
  // }
}
