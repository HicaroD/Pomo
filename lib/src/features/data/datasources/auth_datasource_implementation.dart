import '../../../core/errors/exceptions.dart';
import '../../../core/http_client/http_client_interface.dart';
import '../../../core/http_client/http_response.dart';
import '../../../utils/api_endpoints.dart';
import '../../domain/datasources/auth_datasource_interface.dart';
import '../models/user_model.dart';
import '../../domain/entities/sign_in_credentials_entity.dart';

class AuthDatasourceImpl implements IAuthDatasource {
  final IHttpClient httpClient;

  AuthDatasourceImpl(this.httpClient);

  @override
  Future<String> signIn(SignInCredentialsEntity credentials) async {
    HttpResponse response = await httpClient.post(LOGIN_ENDPOINT, body: {
      "email": credentials.email,
      "password": credentials.password,
    });

    switch (response.statusCode) {
      case 200:
        return response.body["token"];
      case 400:
        throw InvalidCredentialsException();
      default:
        throw SignInException();
    }
  }

  @override
  Future<UserModel> signUp(SignInCredentialsEntity credentials) async {
    HttpResponse response = await httpClient.post(LOGIN_ENDPOINT, body: {
      "email": credentials.email,
      "password": credentials.password,
    });

    switch (response.statusCode) {
      case 201:
        return response.body["token"];
      case 400:
        throw InvalidCredentialsException();
      default:
        throw SignInException();
    }
  }
}
