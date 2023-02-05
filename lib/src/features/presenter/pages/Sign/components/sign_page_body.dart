import 'package:flutter/widgets.dart';

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
    return SingleChildScrollView(
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
    );
  }
}
