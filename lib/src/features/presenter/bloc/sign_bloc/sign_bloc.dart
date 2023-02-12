import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../domain/usecases/user_sign_in_usecase.dart';
import '../../../domain/usecases/user_sign_up_usecase.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  final UserSignInUsecase userSignInUsecase;
  final UserSignUpUsecase userSignUpUsecase;

  SignBloc({
    required this.userSignInUsecase,
    required this.userSignUpUsecase,
  }) : super(SignInitial()) {
    on<SignInRequestEvent>((event, emit) async {
      final Either<Failure, String> result =
          await userSignInUsecase(event.params);

      result.fold(
        (failure) =>
            throw UnimplementedError("Sign in bad state to be implemented"),
        (token) => SignInSuccessfulState(token),
      );
    });

    on<SignUpRequestEvent>((event, emit) async {
      final result = await userSignUpUsecase(event.params);
      result.fold(
        (failure) =>
            throw UnimplementedError("Sign up bad state to be implemented"),
        (_) => SignUpSuccessfulState(),
      );
    });
  }
}
