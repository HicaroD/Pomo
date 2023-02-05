import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entities/sign_in_credentials_entity.dart';
import '../entities/sign_up_credentials_entity.dart';
import '../entities/user_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, String>> signIn(SignInCredentialsEntity credentials);
  Future<Either<Failure, UserEntity>> signUp(
    SignUpCredentialsEntity credentials,
  );
}
