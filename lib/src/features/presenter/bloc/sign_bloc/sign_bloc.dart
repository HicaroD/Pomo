import 'package:bloc/bloc.dart';

import '../../../domain/usecases/user_sign_in_usecase.dart';
import '../../../domain/usecases/user_sign_up_usecase.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvent, SignState> {
  SignBloc() : super(SignInitial()) {
    on<SignInRequestEvent>((event, emit) {
      // TODO: access repository to do sign in
      print("SIGN IN REQUEST EVENT");
      print(event.params);
    });
    on<SignUpRequestEvent>((event, emit) {
      // TODO: access repository to do sign up
      print("SIGN UP REQUEST EVENT");
      print(event.params);
    });
  }
}
