import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/params/sign_in_params.dart';
import '../../../../core/params/sign_up_params.dart';
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

      print(result);

      return emit(result.fold(
        (failure) => _handleSignInFailure(failure),
        (token) => SignInSuccessfulState(token),
      ));
    });

    on<SignUpRequestEvent>((event, emit) async {
      final result = await userSignUpUsecase(event.params);
      return emit(result.fold(
        (failure) => _handleSignUpFailure(failure),
        (_) => SignUpSuccessfulState(),
      ));
    });
  }

  SignState _handleSignInFailure(Failure failure) {
    if (failure is InvalidCredentialsFormatFailure ||
        failure is InvalidCredentialsFailure) {
      return SignInWrongCredentials();
    } else if (failure is TimeoutFailure ||
        failure is NoInternetConnectionFailure) {
      return SignBadInternetConnection();
    }

    return SignInBadBehavior();
  }

  SignState _handleSignUpFailure(Failure failure) {
    if (failure is InvalidCredentialsFormatFailure) {
      return SignUpWrongCredentials();
    } else if (failure is CredentialsAlreadyInUseFailure) {
      return SignUpCredentialsAlreadyUsed();
    } else if (failure is TimeoutFailure ||
        failure is NoInternetConnectionFailure) {
      return SignBadInternetConnection();
    }
    return SignUpBadBehavior();
  }
}
