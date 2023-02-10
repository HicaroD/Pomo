import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entities/user_entity.dart';
import '../usecases/user_sign_in_usecase.dart';
import '../usecases/user_sign_up_usecase.dart';

abstract class IAuthRepository {
  Future<Either<Failure, String>> signIn(SignInParams credentials);
  Future<Either<Failure, UserEntity>> signUp(
    SignUpParams credentials,
  );
}
