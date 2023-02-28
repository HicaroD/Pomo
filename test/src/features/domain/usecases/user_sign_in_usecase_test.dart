import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomo_app/src/core/errors/failures.dart';
import 'package:pomo_app/src/core/params/sign_in_params.dart';
import 'package:pomo_app/src/data/repositories/auth_repository_implementation.dart';
import 'package:pomo_app/src/domain/repositories/auth_repository_interface.dart';
import 'package:pomo_app/src/domain/usecases/user_sign_in_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepositoryImpl {}

void main() {
  late IAuthRepository authRepository;
  late UserSignInUsecase signInUsecase;

  setUp(() {
    authRepository = MockAuthRepository();
    signInUsecase = UserSignInUsecase(authRepository);
  });

  final signInCredentials =
      SignInParams(email: "teste@teste.com", password: "password");
  const String properResult = "SOME_EXAMPLE";

  test('should get Right(String) from repository', () async {
    when(() => authRepository.signIn(signInCredentials))
        .thenAnswer((_) async => const Right(properResult));

    final result = await signInUsecase(signInCredentials);

    expect(result, equals(const Right(properResult)));
    verify(() => authRepository.signIn(signInCredentials)).called(1);
  });

  group("Left state", () {
    test("should get Left(InvalidCredentials) when repository fails", () async {
      when(() => authRepository.signIn(signInCredentials))
          .thenAnswer((_) async => Left(InvalidCredentialsFailure()));

      final result = await signInUsecase(signInCredentials);

      expect(result, equals(Left(InvalidCredentialsFailure())));
      verify(() => authRepository.signIn(signInCredentials)).called(1);
    });

    test(
        "should get Left(InvalidCredentialsFormatFailure) when repository fails",
        () async {
      when(() => authRepository.signIn(signInCredentials))
          .thenAnswer((_) async => Left(InvalidCredentialsFormatFailure()));

      final result = await signInUsecase(signInCredentials);

      expect(result, equals(Left(InvalidCredentialsFormatFailure())));
      verify(() => authRepository.signIn(signInCredentials)).called(1);
    });

    test("should get Left(ServerFailure) when repository fails", () async {
      when(() => authRepository.signIn(signInCredentials))
          .thenAnswer((_) async => Left(ServerFailure()));

      final result = await signInUsecase(signInCredentials);

      expect(result, equals(Left(ServerFailure())));
      verify(() => authRepository.signIn(signInCredentials)).called(1);
    });

    test("should get Left(SignInFailure) when repository fails", () async {
      when(() => authRepository.signIn(signInCredentials))
          .thenAnswer((_) async => Left(SignInFailure()));

      final result = await signInUsecase(signInCredentials);

      expect(result, equals(Left(SignInFailure())));
      verify(() => authRepository.signIn(signInCredentials)).called(1);
    });

    test("should get Left(TimeoutFailure) when repository fails", () async {
      when(() => authRepository.signIn(signInCredentials))
          .thenAnswer((_) async => Left(TimeoutFailure()));

      final result = await signInUsecase(signInCredentials);

      expect(result, equals(Left(TimeoutFailure())));
      verify(() => authRepository.signIn(signInCredentials)).called(1);
    });

    test("should get Left(NoInternetConnectionFailure) when repository fails",
        () async {
      when(() => authRepository.signIn(signInCredentials))
          .thenAnswer((_) async => Left(NoInternetConnectionFailure()));

      final result = await signInUsecase(signInCredentials);

      expect(result, equals(Left(NoInternetConnectionFailure())));
      verify(() => authRepository.signIn(signInCredentials)).called(1);
    });
  });
}
