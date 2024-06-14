import 'package:first_flutter_project/core/model/user_model.dart';

class Repository {
  final String name;
  final String? description;
  final int starsCount;

  Repository({
    required this.name,
    required this.description,
    required this.starsCount,
  });

  factory Repository.fromJson(Json json) {
    return Repository(
      name: json['name'],
      description: json['description'],
      starsCount: json['stargazers_count'],
    );
  }
}
