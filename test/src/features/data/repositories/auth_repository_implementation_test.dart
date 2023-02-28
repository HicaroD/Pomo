import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomo_app/src/core/errors/exceptions.dart';
import 'package:pomo_app/src/core/errors/failures.dart';
import 'package:pomo_app/src/core/params/sign_in_params.dart';
import 'package:pomo_app/src/core/params/sign_up_params.dart';
import 'package:pomo_app/src/data/datasources/auth_datasource_implementation.dart';
import 'package:pomo_app/src/data/models/user_model.dart';
import 'package:pomo_app/src/data/repositories/auth_repository_implementation.dart';
import 'package:pomo_app/src/domain/repositories/auth_repository_interface.dart';

class MockAuthDatasource extends Mock implements AuthDatasourceImpl {}

void main() {
  late IAuthDatasource mockAuthDatasource;
  late IAuthRepository authRepository;

  setUp(() {
    mockAuthDatasource = MockAuthDatasource();
    authRepository = AuthRepositoryImpl(mockAuthDatasource);
  });

  group("test sign in", () {
    final signInCredentials =
        SignInParams(email: "teste@teste.com", password: "testepassword");

    test(
        "should throw [InvalidCredentialsFormatFailure] when user credentials are empty",
        () async {
      final result =
          await authRepository.signIn(SignInParams(email: "", password: ""));

      expect(result, equals(Left(InvalidCredentialsFormatFailure())));
      verifyZeroInteractions(mockAuthDatasource);
    });

    const response = "120310230103103akasdkakda0123010310";
    test("should return a [String] when datasource returns a String", () async {
      when(() => mockAuthDatasource.signIn(signInCredentials))
          .thenAnswer((_) async => response);

      final result = await authRepository.signIn(signInCredentials);

      expect(result, equals(const Right(response)));
      verify(() => mockAuthDatasource.signIn(signInCredentials)).called(1);
    });

    test(
        "should throw [InvalidCredentialsFailure] when datasource throws [InvalidCredentialsException]",
        () async {
      when(() => mockAuthDatasource.signIn(signInCredentials))
          .thenThrow(InvalidCredentialsException());

      final result = await authRepository.signIn(signInCredentials);

      expect(result, equals(Left(InvalidCredentialsFailure())));
      verify(() => mockAuthDatasource.signIn(signInCredentials)).called(1);
    });

    test(
        "should throw [ServerFailure] when datasource throws [ServerException]",
        () async {
      when(() => mockAuthDatasource.signIn(signInCredentials))
          .thenThrow(ServerException());

      final result = await authRepository.signIn(signInCredentials);

      expect(result, equals(Left(ServerFailure())));
      verify(() => mockAuthDatasource.signIn(signInCredentials)).called(1);
    });

    test(
        "should throw [SignInFailure] when datasource throws [SignInException]",
        () async {
      when(() => mockAuthDatasource.signIn(signInCredentials))
          .thenThrow(SignInException());

      final result = await authRepository.signIn(signInCredentials);

      expect(result, equals(Left(SignInFailure())));
      verify(() => mockAuthDatasource.signIn(signInCredentials)).called(1);
    });

    test(
        "should throw [TimeoutFailure] when datasource throws [TimeoutException]",
        () async {
      when(() => mockAuthDatasource.signIn(signInCredentials))
          .thenThrow(TimeoutException(null));

      final result = await authRepository.signIn(signInCredentials);

      expect(result, equals(Left(TimeoutFailure())));
      verify(() => mockAuthDatasource.signIn(signInCredentials)).called(1);
    });

    test(
        "should throw [NoInternetConnectionFailure] when datasource throws [SocketException]",
        () async {
      when(() => mockAuthDatasource.signIn(signInCredentials))
          .thenThrow(const SocketException(""));

      final result = await authRepository.signIn(signInCredentials);

      expect(result, equals(Left(NoInternetConnectionFailure())));
      verify(() => mockAuthDatasource.signIn(signInCredentials)).called(1);
    });
  });

  group("test sign up", () {
    final signUpParams = SignUpParams(
      name: "nameteste",
      username: "usernameteste",
      email: "email@teste.com",
      password: "testepassword",
    );

    test(
        "should throw [InvalidCredentialsFormatFailure] when user credentials are empty",
        () async {
      final result = await authRepository.signUp(
          SignUpParams(email: "", password: "", username: "", name: ""));

      expect(result, equals(Left(InvalidCredentialsFormatFailure())));
      verifyZeroInteractions(mockAuthDatasource);
    });

    final response = UserModel(
      id: "20310031",
      name: "nameteste",
      username: "usernameteste",
      email: "email@teste.com",
    );

    test("should return a [String] when datasource returns a String", () async {
      when(() => mockAuthDatasource.signUp(signUpParams))
          .thenAnswer((_) async => response);

      final result = await authRepository.signUp(signUpParams);

      expect(result, equals(Right(response)));
      verify(() => mockAuthDatasource.signUp(signUpParams)).called(1);
    });

    test(
        "should throw [CredentialsAlreadyInUseFailure] when datasource throws [CredentialsAlreadyInUseException]",
        () async {
      when(() => mockAuthDatasource.signUp(signUpParams))
          .thenThrow(CredentialsAlreadyInUseException());

      final result = await authRepository.signUp(signUpParams);

      expect(result, equals(Left(CredentialsAlreadyInUseFailure())));
      verify(() => mockAuthDatasource.signUp(signUpParams)).called(1);
    });

    test(
        "should throw [ServerFailure] when datasource throws [ServerException]",
        () async {
      when(() => mockAuthDatasource.signUp(signUpParams))
          .thenThrow(ServerException());

      final result = await authRepository.signUp(signUpParams);

      expect(result, equals(Left(ServerFailure())));
      verify(() => mockAuthDatasource.signUp(signUpParams)).called(1);
    });

    test(
        "should throw [SignUpFailure] when datasource throws [SignUpException]",
        () async {
      when(() => mockAuthDatasource.signUp(signUpParams))
          .thenThrow(SignUpException());

      final result = await authRepository.signUp(signUpParams);

      expect(result, equals(Left(SignUpFailure())));
      verify(() => mockAuthDatasource.signUp(signUpParams)).called(1);
    });

    test(
        "should throw [TimeoutFailure] when datasource throws [TimeoutException]",
        () async {
      when(() => mockAuthDatasource.signUp(signUpParams))
          .thenThrow(TimeoutException(null));

      final result = await authRepository.signUp(signUpParams);

      expect(result, equals(Left(TimeoutFailure())));
      verify(() => mockAuthDatasource.signUp(signUpParams)).called(1);
    });

    test(
        "should throw [NoInternetConnectionFailure] when datasource throws [SocketException]",
        () async {
      when(() => mockAuthDatasource.signUp(signUpParams))
          .thenThrow(const SocketException(""));

      final result = await authRepository.signUp(signUpParams);

      expect(result, equals(Left(NoInternetConnectionFailure())));
      verify(() => mockAuthDatasource.signUp(signUpParams)).called(1);
    });
  });
}
