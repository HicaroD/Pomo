import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../domain/usecases/user_sign_up_usecase.dart';
import '../../../bloc/sign_bloc/sign_bloc.dart';
import '../../../widgets/Buttons/primary_button.dart';
import '../../../widgets/FormField/field_type.dart';
import '../../../widgets/FormManager/form_field_content.dart';
import '../../../widgets/FormManager/form_manager.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
  late SignBloc signBloc;

  @override
  void initState() {
    super.initState();
    signUpForms.addListener(_isButtonActivated);
    signBloc = context.read<SignBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        signUpForms.buildForms(),
        const SizedBox(height: 30),
        SizedBox(
          width: 150,
          child: PrimaryButton(
            onPressed: _isSignButtonActivated ? _signUp : null,
            text: "Entrar",
          ),
        ),
      ],
    );
  }

  void _signUp() async {
    Map<String, String> data = signUpForms.data();
    final credentials = SignUpParams(
      name: data["name"]!,
      username: data["username"]!,
      email: data["email"]!,
      password: data["password"]!,
    );
    signBloc.add(SignUpRequestEvent(credentials));
    // TODO: store JWT token to use on subsequent request
  }

  void _isButtonActivated() {
    if (mounted) {
      setState(() {
        _isSignButtonActivated = signUpForms.isValid();
      });
    }
  }

  @override
  void dispose() {
    signUpForms.disposeControllers();
    signBloc.close();
    super.dispose();
  }
}
