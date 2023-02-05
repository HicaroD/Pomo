import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';

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
  Future<Either<Failure, String>> signIn(
      SignInCredentialsEntity credentials) async {
    if (!credentials.isValid()) {
      throw InvalidCredentialsFormatFailure();
    }

    try {
      String token = await authDatasource.signIn(credentials);
      return Right(token);
    } on InvalidCredentialsException {
      throw Left(InvalidCredentialsFailure());
    } on ServerException {
      throw Left(ServerFailure());
    } on SignInException {
      throw Left(SignInFailure());
    } on TimeoutException {
      throw Left(TimeoutFailure());
    } on SocketException {
      throw Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(
      SignUpCredentialsEntity credentials) async {
    if (!credentials.isValid()) {
      throw InvalidCredentialsFormatFailure();
    }

    try {
      UserModel createdUser = await authDatasource.signUp(credentials);
      return Right(createdUser);
    } on CredentialsAlreadyInUseException {
      throw Left(CredentialsAlreadyInUseFailure());
    } on ServerException {
      throw Left(ServerFailure());
    } on SignUpException {
      throw Left(SignUpFailure());
    } on TimeoutException {
      throw Left(TimeoutFailure());
    } on SocketException {
      throw Left(NoInternetConnectionFailure());
    }
  }
}
