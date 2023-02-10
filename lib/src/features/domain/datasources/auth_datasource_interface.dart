import '../../data/models/user_model.dart';
import '../usecases/user_sign_in_usecase.dart';
import '../usecases/user_sign_up_usecase.dart';

abstract class IAuthDatasource {
  Future<String> signIn(SignInParams credentials);
  Future<UserModel> signUp(SignUpParams credentials);
}
