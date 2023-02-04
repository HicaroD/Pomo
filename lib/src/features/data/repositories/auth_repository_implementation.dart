import '../../../core/errors/failures.dart';
import '../../domain/datasources/auth_datasource_interface.dart';
import '../../domain/entities/sign_in_credentials_entity.dart';
import '../../domain/entities/sign_up_credentials_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository_interface.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthDatasource authDatasource;

  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<String> signIn(SignInCredentialsEntity credentials) {
    if (!credentials.isValid()) {
      throw InvalidCredentialsFormatFailure();
    }

    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signUp(SignUpCredentialsEntity credentials) {
    if (!credentials.isValid()) {
      throw InvalidCredentialsFormatFailure();
    }

    throw UnimplementedError();
  }
}
