import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomo_app/src/core/errors/failures.dart';
import 'package:pomo_app/src/core/params/sign_up_params.dart';
import 'package:pomo_app/src/data/models/user_model.dart';
import 'package:pomo_app/src/data/repositories/auth_repository_implementation.dart';
import 'package:pomo_app/src/domain/repositories/auth_repository_interface.dart';
import 'package:pomo_app/src/domain/usecases/user_sign_up_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepositoryImpl {}

void main() {
  late IAuthRepository authRepository;
  late UserSignUpUsecase signUpUsecase;

  setUp(() {
    authRepository = MockAuthRepository();
    signUpUsecase = UserSignUpUsecase(authRepository);
  });

  final signUpCredentials = SignUpParams(
    name: "teste",
    username: "teste",
    email: "teste",
    password: "teste",
  );

  final userModel =
      UserModel(id: "120310", name: "teste", username: "teste", email: "teste");
  test("should get Right(UserModel) when repository's call is successful",
      () async {
    when(() => authRepository.signUp(signUpCredentials)).thenAnswer(
      (_) async => Right(userModel),
    );

    final result = await signUpUsecase(signUpCredentials);

    expect(result, equals(Right(userModel)));
    verify(() => authRepository.signUp(signUpCredentials)).called(1);
  });

  group("Left state", () {
    test(
        "should get Left(InvalidCredentialsFormatFailure) when repository's call fails",
        () async {
      when(() => authRepository.signUp(signUpCredentials)).thenAnswer(
        (_) async => Left(InvalidCredentialsFormatFailure()),
      );

      final result = await signUpUsecase(signUpCredentials);

      expect(result, equals(Left(InvalidCredentialsFormatFailure())));
      verify(() => authRepository.signUp(signUpCredentials)).called(1);
    });

    test(
        "should get Left(CredentialsAlreadyInUseFailure) when repository's call fails",
        () async {
      when(() => authRepository.signUp(signUpCredentials)).thenAnswer(
        (_) async => Left(CredentialsAlreadyInUseFailure()),
      );

      final result = await signUpUsecase(signUpCredentials);

      expect(result, equals(Left(CredentialsAlreadyInUseFailure())));
      verify(() => authRepository.signUp(signUpCredentials)).called(1);
    });
    test("should get Left(ServerFailure) when repository's call fails",
        () async {
      when(() => authRepository.signUp(signUpCredentials)).thenAnswer(
        (_) async => Left(ServerFailure()),
      );

      final result = await signUpUsecase(signUpCredentials);

      expect(result, equals(Left(ServerFailure())));
      verify(() => authRepository.signUp(signUpCredentials)).called(1);
    });
    test("should get Left(SignUpFailure) when repository's call fails",
        () async {
      when(() => authRepository.signUp(signUpCredentials)).thenAnswer(
        (_) async => Left(SignUpFailure()),
      );

      final result = await signUpUsecase(signUpCredentials);

      expect(result, equals(Left(SignUpFailure())));
      verify(() => authRepository.signUp(signUpCredentials)).called(1);
    });
    test("should get Left(TimeoutFailure) when repository's call fails",
        () async {
      when(() => authRepository.signUp(signUpCredentials)).thenAnswer(
        (_) async => Left(TimeoutFailure()),
      );

      final result = await signUpUsecase(signUpCredentials);

      expect(result, equals(Left(TimeoutFailure())));
      verify(() => authRepository.signUp(signUpCredentials)).called(1);
    });
    test(
        "should get Left(NoInternetConnectionFailure) when repository's call fails",
        () async {
      when(() => authRepository.signUp(signUpCredentials)).thenAnswer(
        (_) async => Left(NoInternetConnectionFailure()),
      );

      final result = await signUpUsecase(signUpCredentials);

      expect(result, equals(Left(NoInternetConnectionFailure())));
      verify(() => authRepository.signUp(signUpCredentials)).called(1);
    });
  });
}
