import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/Buttons/primary_button.dart';
import '../../../widgets/Buttons/secondary_button.dart';
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

  final signInForms = FormManager(
    formKey: GlobalKey<FormState>(),
    formContent: <String, FormFieldContent>{
      "email": FormFieldContent(
        labelText: "E-mail",
        hintText: "Entre com seu e-mail",
      ),
      "password": FormFieldContent(
        labelText: "Senha",
        hintText: "Digite sua senha",
      ),
    },
  );

  final signUpForms = FormManager(
    formKey: GlobalKey<FormState>(),
    formContent: <String, FormFieldContent>{
      "name": FormFieldContent(
        labelText: "Nome",
        hintText: "Digite seu nome completo",
      ),
      "username": FormFieldContent(
        labelText: "Nome de usuário",
        hintText: "Digite seu nome de usuário",
      ),
      "email": FormFieldContent(
        labelText: "E-mail",
        hintText: "Entre com seu e-mail",
      ),
      "password": FormFieldContent(
        labelText: "Senha",
        hintText: "Digite sua senha",
      ),
    },
  );

  bool _isSignInForm = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SecondaryButton(
              "Entrar",
              onPressed: () {
                if (!mounted) return;
                setState(() {
                  _isSignInForm = true;
                });
              },
              hasBottomBorder: _isSignInForm,
            ),
            SecondaryButton(
              "Registrar",
              onPressed: () {
                if (!mounted) return;
                setState(() {
                  _isSignInForm = false;
                });
              },
              hasBottomBorder: !_isSignInForm,
            ),
          ],
        ),
        SizedBox(
          width: screenSize.width * 0.8,
          child: Column(
            children: <Widget>[
              _isSignInForm
                  ? signInForms.buildForms()
                  : signUpForms.buildForms(),
              SizedBox(
                width: 150,
                child: PrimaryButton(
                  onPressed: _sign,
                  text: _isSignInForm ? "Entrar" : "Registrar",
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _sign() {
    Map<String, String> data = signInForms.data();
    if (!_isSignInForm) {
      data = signUpForms.data();
    }
    print(data);
  }

  @override
  void dispose() {
    signInForms.disposeControllers();
    signUpForms.disposeControllers();
    super.dispose();
  }
}
