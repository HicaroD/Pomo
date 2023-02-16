import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../../core/params/sign_in_params.dart';
import '../../../core/params/sign_up_params.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository_interface.dart';
import '../datasources/auth_datasource_implementation.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource authDatasource;

  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<Either<Failure, String>> signIn(SignInParams credentials) async {
    if (credentials.areEmpty()) {
      throw InvalidCredentialsFormatFailure();
    }

    try {
      String token = await authDatasource.signIn(credentials);
      return Right(token);
    } on InvalidCredentialsException {
      return Left(InvalidCredentialsFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on SignInException {
      return Left(SignInFailure());
    } on TimeoutException {
      return Left(TimeoutFailure());
    } on SocketException {
      return Left(NoInternetConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(SignUpParams credentials) async {
    if (credentials.areEmpty()) {
      throw InvalidCredentialsFormatFailure();
    }

    try {
      UserModel createdUser = await authDatasource.signUp(credentials);
      return Right(createdUser);
    } on CredentialsAlreadyInUseException {
      return Left(CredentialsAlreadyInUseFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on SignUpException {
      return Left(SignUpFailure());
    } on TimeoutException {
      return Left(TimeoutFailure());
    } on SocketException {
      return Left(NoInternetConnectionFailure());
    }
  }
}
