import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../../core/params/sign_in_params.dart';
import '../../core/params/sign_up_params.dart';
import '../entities/user_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, String>> signIn(SignInParams credentials);
  Future<Either<Failure, UserEntity>> signUp(
    SignUpParams credentials,
  );
}
