import 'package:equatable/equatable.dart';

class InvalidCredentialsException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}

class CredentialsAlreadyInUseException implements Exception {}

class ServerException implements Exception {}

class SignInException implements Exception {}

class SignUpException implements Exception {}
