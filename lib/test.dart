typedef Json = Map<String, dynamic>;

void main() {
  // final messageJson = {
  //   'message_id': 55,
  //   'content': "Flutter lessons",
  //   'user': {
  //     'name': 'Dart',
  //     'age': 50,
  //   }
  // };

  // final message = Message.fromJson(messageJson);

  // print("username: ${message.user.toJson()}");

  Game game = Game();
  game.increaseScore();
  game.increaseScore();
  game.increaseScore();

  print("SCORE:  ${Game().score}");

  print('---------------------------------');

  Game.increaseScoreStatic();
  Game.increaseScoreStatic();
  Game.increaseScoreStatic();

  print("SCORE 1:  ${Game.score1}");
}

class PrivateClass {
  PrivateClass._();
  static PrivateClass? instance =  PrivateClass._();
  int a = 10;
}

class Game {
  int score = 0;
  static int score1 = 0;

  void increaseScore() {
    score += 10;
    print(score);
  }

  static increaseScoreStatic() {
    score1 += 10;
    print(score1);
  }
}

class User {
  final String name;
  final int age;

  User({
    required this.name,
    required this.age,
  });

  factory User.fromJson(Json json) {
    return User(
      name: json['name'],
      age: json['age'],
    );
  }

  Json toJson() {
    return {
      'name': name,
      'age': age,
    };
  }
}

class Message {
  final int messageID;
  final String content;
  final User user;

  Message({required this.messageID, required this.content, required this.user});

  factory Message.fromJson(Json json) {
    return Message(
      messageID: json['message_id'],
      content: json['content'],
      user: User.fromJson(json['user']),
    );
  }

  Json toJson() {
    return {
      'message_id': messageID,
      'content': content,
      'user': user.toJson(),
    };
  }
}
