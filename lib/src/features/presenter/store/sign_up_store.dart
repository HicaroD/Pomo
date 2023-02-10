import 'package:flutter_triple/flutter_triple.dart';

import '../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/user_sign_up_usecase.dart';

class SignUpStore extends NotifierStore<Failure, UserEntity> {
  final UserSignUpUsecase signUpUsecase;

  SignUpStore(this.signUpUsecase)
      : super(
          UserEntity(
            id: "id",
            name: "name",
            username: "username",
            email: "email",
          ),
        );

  signUp(SignUpParams credentials) async {
    setLoading(true);
    final response = await signUpUsecase(credentials);
    response.fold(
      (error) => setError(error),
      (success) => update(success),
    );
    setLoading(false);
  }
}
