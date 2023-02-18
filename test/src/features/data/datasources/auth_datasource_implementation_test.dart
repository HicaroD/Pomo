import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pomo_app/src/core/errors/exceptions.dart';
import 'package:pomo_app/src/core/http_client/http_client.dart';
import 'package:pomo_app/src/core/http_client/http_response.dart';
import 'package:pomo_app/src/core/params/sign_in_params.dart';
import 'package:pomo_app/src/core/params/sign_up_params.dart';
import 'package:pomo_app/src/features/data/datasources/auth_datasource_implementation.dart';
import 'package:pomo_app/src/features/data/models/user_model.dart';
import 'package:pomo_app/src/utils/api_endpoints.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late HttpClient mockHttpClient;
  late IAuthDatasource authDatasource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    authDatasource = AuthDatasourceImpl(mockHttpClient);
  });

  group("test sign in endpoint", () {
    final signInCredentials = SignInParams(
      email: "testeuser@email.com",
      password: "testeuserpassword",
    );

    const jwtoToken =
        "10230130030301sdkakdkas.oaspazmsdapqweqçáspdoqweiqepqsd.o0'1k2'1kmsdkakdakdalwleqlasçd";
    final signInProperResponse = {
      "message": "Login was made successfully",
      "token": jwtoToken,
    };

    test(
      "should return a String with JWT token when sign in endpoint returns 200",
      () async {
        when(() => mockHttpClient.post(
              SIGN_IN_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).thenAnswer(
          (_) async =>
              HttpResponse(body: signInProperResponse, statusCode: 200),
        );

        final result = await authDatasource.signIn(signInCredentials);

        expect(result, equals(jwtoToken));
        verify(() => mockHttpClient.post(SIGN_IN_ENDPOINT,
            body: any(named: "body"),
            headers: any(named: "headers"))).called(1);
      },
    );

    test(
      "should throw [InvalidCredentialsException] when sign in endpoint returns 400",
      () async {
        when(() => mockHttpClient.post(
              SIGN_IN_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).thenAnswer(
          (_) async => HttpResponse(body: {}, statusCode: 400),
        );

        final result = authDatasource.signIn(signInCredentials);

        expect(result, throwsA(isA<InvalidCredentialsException>()));
        verify(() => mockHttpClient.post(SIGN_IN_ENDPOINT,
            body: any(named: "body"),
            headers: any(named: "headers"))).called(1);
      },
    );

    test(
      "should throw [ServerException] when sign in endpoint returns 400",
      () async {
        when(() => mockHttpClient.post(
              SIGN_IN_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).thenAnswer(
          (_) async => HttpResponse(body: {}, statusCode: 500),
        );

        final result = authDatasource.signIn(signInCredentials);

        expect(result, throwsA(isA<ServerException>()));
        verify(() => mockHttpClient.post(SIGN_IN_ENDPOINT,
            body: any(named: "body"),
            headers: any(named: "headers"))).called(1);
      },
    );

    test(
      "should throw [SignInException] when sign in endpoint returns an error status code",
      () async {
        when(() => mockHttpClient.post(
              SIGN_IN_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).thenAnswer(
          (_) async => HttpResponse(body: {}, statusCode: 501),
        );

        final result = authDatasource.signIn(signInCredentials);

        expect(result, throwsA(isA<SignInException>()));
        verify(() => mockHttpClient.post(SIGN_IN_ENDPOINT,
            body: any(named: "body"),
            headers: any(named: "headers"))).called(1);
      },
    );
  });

  group('test sign up endpoint', () {
    final signUpParams = SignUpParams(
      name: "teste",
      username: "testeusername",
      email: "teste@teste.com",
      password: "testepassword",
    );

    final signUpResponse = {
      "message": "User created successfully",
      "user": {
        "id": "63ef57935768851293192391231jkaskda",
        "name": "teste",
        "username": "testeusername",
        "email": "teste@teste.com"
      }
    };

    UserModel userModelResponse = UserModel(
      id: "63ef57935768851293192391231jkaskda",
      name: "teste",
      username: "testeusername",
      email: "teste@teste.com",
    );

    test(
      "should return a UserModel when sign up endpoint returns 201",
      () async {
        when(() => mockHttpClient.post(
              SIGN_UP_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).thenAnswer(
          (_) async => HttpResponse(body: signUpResponse, statusCode: 201),
        );

        final result = await authDatasource.signUp(signUpParams);

        expect(result, equals(userModelResponse));
        verify(() => mockHttpClient.post(
              SIGN_UP_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).called(1);
      },
    );

    test(
      "should throw [CredentialsAlreadyInUseException] when sign up endpoint returns 400",
      () async {
        when(() => mockHttpClient.post(
              SIGN_UP_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).thenAnswer(
          (_) async => HttpResponse(body: {}, statusCode: 400),
        );

        final result = authDatasource.signUp(signUpParams);

        expect(result, throwsA(isA<CredentialsAlreadyInUseException>()));
        verify(() => mockHttpClient.post(
              SIGN_UP_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).called(1);
      },
    );

    test(
      "should throw [ServerException] when sign up endpoint returns 500",
      () async {
        when(() => mockHttpClient.post(
              SIGN_UP_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).thenAnswer(
          (_) async => HttpResponse(body: {}, statusCode: 500),
        );

        final result = authDatasource.signUp(signUpParams);

        expect(result, throwsA(isA<ServerException>()));
        verify(() => mockHttpClient.post(
              SIGN_UP_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).called(1);
      },
    );

    test(
      "should throw [SignUpException] when sign up endpoint returns an error status code other than (400 and 500)",
      () async {
        when(() => mockHttpClient.post(
              SIGN_UP_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).thenAnswer(
          (_) async => HttpResponse(body: {}, statusCode: 501),
        );

        final result = authDatasource.signUp(signUpParams);

        expect(result, throwsA(isA<SignUpException>()));
        verify(() => mockHttpClient.post(
              SIGN_UP_ENDPOINT,
              body: any(named: "body"),
              headers: any(named: "headers"),
            )).called(1);
      },
    );
  });
}
