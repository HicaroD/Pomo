import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  String id;
  String name;
  String username;
  String email;

  UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, username, email];
}
