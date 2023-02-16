part of 'sign_bloc.dart';

abstract class SignState {}

class SignInitial extends SignState {}

class SignInSuccessfulState extends SignState {
  final String token;

  SignInSuccessfulState(this.token);
}

class SignInWrongCredentials extends SignState {}

class SignInBadBehavior extends SignState {}

class SignUpSuccessfulState extends SignState {}

class SignUpWrongCredentials extends SignState {}

class SignUpCredentialsAlreadyUsed extends SignState {}

class SignUpBadBehavior extends SignState {}

class SignBadInternetConnection extends SignState {}
