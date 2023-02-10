import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../domain/usecases/user_sign_in_usecase.dart';
import '../../../store/sign_in_store.dart';
import '../../../widgets/Buttons/primary_button.dart';
import '../../../widgets/FormField/field_type.dart';
import '../../../widgets/FormManager/form_field_content.dart';
import '../../../widgets/FormManager/form_manager.dart';
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

  late SignInStore signInStore;

  @override
  void initState() {
    super.initState();
    signInStore = Modular.get<SignInStore>();
    signInForms.addListener(_isButtonActivated);
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
    print(data);
    final credentials = SignInParams(
      email: data["email"]!,
      password: data["password"]!,
    );
    await signInStore.signIn(credentials);
    // TODO: handle errors and show appropriate alert dialog
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
