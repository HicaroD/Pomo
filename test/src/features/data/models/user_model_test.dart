import 'package:flutter_test/flutter_test.dart';
import 'package:pomo_app/src/data/models/user_model.dart';

void main() {
  final userModel = UserModel(
    id: "1010",
    name: "teste",
    username: "username",
    email: "email",
  );

  final userModelAsMap = {
    "id": "1010",
    "name": "teste",
    "username": "username",
    "email": "email",
  };

  test("should return a UserModel in fromJson method", () {
    expect(UserModel.fromJson(userModelAsMap), equals(userModel));
  });

  test("should return a Map object in toJson method", () {
    expect(userModel.toJson(), equals(userModelAsMap));
  });
}
