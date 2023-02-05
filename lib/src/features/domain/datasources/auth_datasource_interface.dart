import '../../data/models/user_model.dart';
import '../entities/sign_in_credentials_entity.dart';
import '../entities/sign_up_credentials_entity.dart';

abstract class IAuthDatasource {
  Future<String> signIn(SignInCredentialsEntity credentials);
  Future<UserModel> signUp(SignUpCredentialsEntity credentials);
}
