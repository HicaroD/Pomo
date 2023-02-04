import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

import 'field_validators.dart';
import '../../../../utils/colors.dart';
import 'field_type.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final FieldType fieldType;
  final Color? textColor;
  final Color? borderColor;

  final bool isRequiredField;

  const CustomFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.fieldType,
    required this.isRequiredField,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  TextEditingController get controller => widget.controller;
  Color? get textColor => widget.textColor;
  Color? get borderColor => widget.borderColor;
  String get labelText => widget.labelText;
  String get hintText => widget.hintText;
  FieldType get fieldType => widget.fieldType;
  bool get isRequiredField => widget.isRequiredField;

  bool _isPasswordInvisible = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: _isPasswordField() && _isPasswordInvisible,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: textColor ?? PomoColors.PRIMARY_WHITE),
        validator: _getValidators(),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: PomoColors.PRIMARY_GREY,
            height: 1,
          ),
          labelStyle: const TextStyle(
            color: PomoColors.PRIMARY_WHITE,
          ),
          errorStyle: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: PomoColors.PRIMARY_YELLOW,
            ),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: PomoColors.PRIMARY_YELLOW,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? PomoColors.PRIMARY_WHITE,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: PomoColors.PRIMARY_WHITE,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? PomoColors.PRIMARY_GREY,
            ),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: PomoColors.PRIMARY_YELLOW,
            ),
          ),
          suffixIcon: _isPasswordField() ? _getPasswordVisibilityIcon() : null,
        ),
      ),
    );
  }

  GestureDetector _getPasswordVisibilityIcon() {
    return GestureDetector(
      onTap: _togglePasswordVisibility,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Icon(
          _isPasswordInvisible ? Icons.visibility_off : Icons.visibility,
          color: _isPasswordInvisible
              ? PomoColors.PRIMARY_GREY
              : PomoColors.PRIMARY_WHITE,
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    if (mounted) {
      setState(() {
        _isPasswordInvisible = !_isPasswordInvisible;
      });
    }
  }

  bool _isPasswordField() {
    return fieldType == FieldType.password;
  }

  String? Function(String?) _getValidators() {
    return FormBuilderValidators.compose(
      [
        isRequiredField ? FormFieldValidators.REQUIRED_VALIDATOR : (_) => null,
        FormFieldValidators.VALIDATORS[fieldType] ?? (_) => null,
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(() {});
  }
}
