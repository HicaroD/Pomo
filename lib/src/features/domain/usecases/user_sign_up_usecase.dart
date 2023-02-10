import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase_interface.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository_interface.dart';

class UserSignUpUsecase implements IUseCase<UserEntity, SignUpParams> {
  final IAuthRepository authRepository;

  UserSignUpUsecase(this.authRepository);

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams credentials) async {
    return await authRepository.signUp(credentials);
  }
}

class SignUpParams {
  final String name;
  final String username;
  final String email;
  final String password;

  SignUpParams({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });
}
