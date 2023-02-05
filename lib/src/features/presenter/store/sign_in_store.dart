import 'package:flutter_triple/flutter_triple.dart';

import '../../../core/errors/failures.dart';
import '../../domain/entities/sign_in_credentials_entity.dart';
import '../../domain/usecases/user_sign_in_usecase.dart';

class SignInStore extends NotifierStore<Failure, String> {
  final UserSignInUsecase signInUsecase;

  SignInStore(this.signInUsecase) : super("");

  signIn(SignInCredentialsEntity credentials) async {
    setLoading(true);
    final response = await signInUsecase(credentials);
    response.fold(
      (error) => setError(error),
      (success) => update(success),
    );
    setLoading(false);
  }
}