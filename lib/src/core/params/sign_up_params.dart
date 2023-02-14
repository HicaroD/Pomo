class SignUpParams {
  final String name;
  final String username;
  final String email;
  final String password;

  SignUpParams({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });

  bool areEmpty() {
    return name.isEmpty | username.isEmpty | email.isEmpty | password.isEmpty;
  }
}
