part of 'sign_bloc.dart';

abstract class SignState {}

class SignInitial extends SignState {}

class SignInSuccessfulState extends SignState {
  final String token;

  SignInSuccessfulState(this.token);
}

class SignUpSuccessfulState extends SignState {}

// TODO: Bad state for sign in and sign up
