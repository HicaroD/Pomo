class SignUpCredentialsEntity {
  final String name;
  final String username;
  final String email;
  final String password;

  SignUpCredentialsEntity(
    this.name,
    this.username,
    this.email,
    this.password,
  );

  // TODO: improve validation function
  bool isValid() {
    return !(name.isEmpty ||
        username.isEmpty ||
        email.isEmpty ||
        password.isEmpty);
  }
}
