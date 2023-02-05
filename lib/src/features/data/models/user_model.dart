import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String id,
    required String name,
    required String username,
    required String email,
  }) : super(
          id: id,
          name: name,
          username: username,
          email: email,
        );

  UserModel.fromJson(Map<String, String> json)
      : super(
          id: json['id']!,
          name: json['name']!,
          username: json['username']!,
          email: json["email"]!,
        ) {
    id = json['id']!;
    name = json['name']!;
    username = json['username']!;
    email = json['email']!;
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}
