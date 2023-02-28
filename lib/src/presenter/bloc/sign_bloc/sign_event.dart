part of 'sign_bloc.dart';

abstract class SignEvent<Params> {}

class SignInRequestEvent implements SignEvent {
  final SignInParams params;
  SignInRequestEvent(this.params);
}

class SignUpRequestEvent implements SignEvent {
  final SignUpParams params;
  SignUpRequestEvent(this.params);
}
