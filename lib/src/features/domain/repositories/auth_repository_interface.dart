import '../entities/sign_in_credentials_entity.dart';
import '../entities/sign_up_credentials_entity.dart';
import '../entities/user_entity.dart';

abstract class IAuthRepository {
  Future<String> signIn(SignInCredentialsEntity credentials);
  Future<UserEntity> signUp(SignUpCredentialsEntity credentials);
}
