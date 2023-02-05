class SignUpCredentialsEntity {
  final String name;
  final String username;
  final String email;
  final String password;

  SignUpCredentialsEntity({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });

  // TODO: improve validation function
  bool isValid() {
    return !(name.isEmpty ||
        username.isEmpty ||
        email.isEmpty ||
        password.isEmpty);
  }
}
