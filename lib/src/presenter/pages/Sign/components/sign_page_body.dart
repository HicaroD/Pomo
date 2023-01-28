import 'package:flutter/widgets.dart';

import 'sign_page_form.dart';
import 'sign_buttons.dart';
import '../../../widgets/FormManager/form_field_content.dart';
import '../../../widgets/FormManager/form_manager.dart';

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
    return Column(
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
        SizedBox(
          width: screenSize.width * 0.8,
          child: SignPageForm(isSignInForm: _isSignInForm),
        ),
      ],
    );
  }
}
