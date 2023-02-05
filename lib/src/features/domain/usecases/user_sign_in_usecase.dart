import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase_interface.dart';
import '../entities/sign_in_credentials_entity.dart';
import '../repositories/auth_repository_interface.dart';

class UserSignInUsecase implements IUseCase<String, SignInCredentialsEntity> {
  final IAuthRepository authRepository;

  UserSignInUsecase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(
      SignInCredentialsEntity credentials) async {
    return await authRepository.signIn(credentials);
  }
}
