class SignInCredentialsEntity {
  final String email;
  final String password;

  SignInCredentialsEntity(this.email, this.password);

  bool isValid() {
    return !(email.isEmpty || password.isEmpty);
  }
}
