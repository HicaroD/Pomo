import 'package:form_builder_validators/form_builder_validators.dart';
import 'field_type.dart';

class FormFieldValidators {
  static Map<FieldType, String? Function(String?)> VALIDATORS = {
    FieldType.email: EMAIL_VALIDATOR,
  };

  static final REQUIRED_VALIDATOR =
      FormBuilderValidators.required(errorText: "Esse campo é obrigatório");

  static final EMAIL_VALIDATOR =
      FormBuilderValidators.email(errorText: "E-mail inválido");
}
