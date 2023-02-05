import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase_interface.dart';
import '../entities/sign_up_credentials_entity.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository_interface.dart';

class UserSignUpUsecase
    implements IUseCase<UserEntity, SignUpCredentialsEntity> {
  final IAuthRepository authRepository;

  UserSignUpUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(
      SignUpCredentialsEntity credentials) async {
    return await authRepository.signUp(credentials);
  }
}
