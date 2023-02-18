import 'package:equatable/equatable.dart';

class Failure extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class InvalidCredentialsFormatFailure extends Failure {}

class InvalidCredentialsFailure extends Failure {}

class ServerFailure extends Failure {}

class SignInFailure extends Failure {}

class SignUpFailure extends Failure {}

class NoInternetConnectionFailure extends Failure {}

class TimeoutFailure extends Failure {}

class CredentialsAlreadyInUseFailure extends Failure {}
