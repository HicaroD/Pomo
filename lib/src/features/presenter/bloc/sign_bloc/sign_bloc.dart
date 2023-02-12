import 'package:bloc/bloc.dart';

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
    on<SignInRequestEvent>((event, emit) {
      print("SIGN IN REQUEST EVENT");
    });
    on<SignUpRequestEvent>((event, emit) {
      // TODO: access repository to do sign up
      print("SIGN UP REQUEST EVENT");
    });
  }
}
