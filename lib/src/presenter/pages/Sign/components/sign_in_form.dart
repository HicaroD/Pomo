import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/params/sign_in_params.dart';
import '../../../bloc/sign_bloc/sign_bloc.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/form_field/field_type.dart';
import '../../../widgets/form_manager/form_field_content.dart';
import '../../../widgets/form_manager/form_manager.dart';
import 'forgot_password_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final signInForms = FormManager(
    formKey: GlobalKey<FormState>(),
    formContent: <String, FormFieldContent>{
      "email": FormFieldContent(
        labelText: "E-mail",
        hintText: "Entre com seu e-mail",
        fieldType: FieldType.email,
      ),
      "password": FormFieldContent(
        labelText: "Senha",
        hintText: "Digite sua senha",
        fieldType: FieldType.password,
      ),
    },
  );

  bool _isSignButtonActivated = false;
  late final SignBloc signBloc;

  @override
  void initState() {
    super.initState();
    signInForms.addListener(_isButtonActivated);
    signBloc = context.read<SignBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        signInForms.buildForms(),
        const SizedBox(height: 30),
        SizedBox(
          width: 150,
          child: PrimaryButton(
            onPressed: _isSignButtonActivated ? _signIn : null,
            text: "Entrar",
          ),
        ),
        const SizedBox(height: 35),
        const ForgotPasswordButton(),
      ],
    );
  }

  void _signIn() async {
    Map<String, String> data = signInForms.data();
    final credentials = SignInParams(
      email: data["email"]!,
      password: data["password"]!,
    );
    signBloc.add(SignInRequestEvent(credentials));
    // TODO: store JWT token to use on subsequent request
  }

  void _isButtonActivated() {
    if (mounted) {
      setState(() {
        _isSignButtonActivated = signInForms.isValid();
      });
    }
  }

  @override
  void dispose() {
    signInForms.disposeControllers();
    super.dispose();
  }
}
