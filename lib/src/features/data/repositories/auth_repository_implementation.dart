import 'dart:async';
import 'dart:io';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../domain/datasources/auth_datasource_interface.dart';
import '../../domain/entities/sign_in_credentials_entity.dart';
import '../../domain/entities/sign_up_credentials_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository_interface.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource authDatasource;

  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<String> signIn(SignInCredentialsEntity credentials) async {
    if (!credentials.isValid()) {
      throw InvalidCredentialsFormatFailure();
    }

    try {
      String token = await authDatasource.signIn(credentials);
      return token;
    } on InvalidCredentialsException {
      throw InvalidCredentialsFailure();
    } on ServerException {
      throw ServerFailure();
    } on SignInException {
      throw SignInFailure();
    } on TimeoutException {
      throw TimeoutFailure();
    } on SocketException {
      throw NoInternetConnectionFailure();
    }
  }

  @override
  Future<UserEntity> signUp(SignUpCredentialsEntity credentials) async {
    if (!credentials.isValid()) {
      throw InvalidCredentialsFormatFailure();
    }

    try {
      UserModel createdUser = await authDatasource.signUp(credentials);
      return createdUser;
    } on CredentialsAlreadyInUseException {
      throw CredentialsAlreadyInUseFailure();
    } on ServerException {
      throw ServerFailure();
    } on SignUpException {
      throw SignUpFailure();
    } on TimeoutException {
      throw TimeoutFailure();
    } on SocketException {
      throw NoInternetConnectionFailure();
    }
  }
}
