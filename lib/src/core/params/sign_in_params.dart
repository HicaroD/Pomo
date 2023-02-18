class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });

  bool areEmpty() {
    return email.isEmpty | password.isEmpty;
  }
}
