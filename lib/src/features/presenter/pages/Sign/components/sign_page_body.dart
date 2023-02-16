import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../utils/app_routes.dart';
import '../../../bloc/sign_bloc/sign_bloc.dart';
import 'sign_buttons.dart';
import 'sign_in_form.dart';
import 'sign_up_form.dart';

class SignPageBody extends StatefulWidget {
  final Size screenSize;

  const SignPageBody({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  @override
  State<SignPageBody> createState() => _SignPageBodyState();
}

class _SignPageBodyState extends State<SignPageBody> {
  Size get screenSize => widget.screenSize;

  bool _isSignInForm = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignBloc, SignState>(
      listener: (context, state) => _handleSignState(state),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SignButtons(
              isSignInForm: _isSignInForm,
              onPressed: (isSignIn) {
                if (mounted) {
                  setState(() {
                    _isSignInForm = isSignIn;
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: screenSize.width * 0.8,
              child: _isSignInForm ? const SignInForm() : const SignUpForm(),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignState(SignState state) {
    if (state is SignInSuccessfulState) {
      Modular.to.navigate(AppRoutes.home.path);
    }
    if (state is SignInWrongCredentials) {
      // TODO
      print("show wrong credentials pop up!");
    }
    if (state is SignUpSuccessfulState) {
      // TODO
      print("show successful registration pop up");
    }
  }
}
