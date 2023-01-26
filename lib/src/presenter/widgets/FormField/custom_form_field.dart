import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo_app/src/utils/colors.dart';

import 'field_type.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final FieldType fieldType;
  final Color? textColor;
  final Color? borderColor;
  final bool isEnabled;

  const CustomFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.isEnabled,
    this.fieldType = FieldType.generic,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  get controller => widget.controller;
  get textColor => widget.textColor;
  get borderColor => widget.borderColor;
  get labelText => widget.labelText;
  get hintText => widget.hintText;
  get fieldType => widget.fieldType;
  get isEnabled => widget.isEnabled;

  bool isPasswordInvisible = true;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        enabled: isEnabled,
        controller: controller,
        obscureText: (fieldType == FieldType.password) && isPasswordInvisible,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: textColor ?? PomoColors.PRIMARY_WHITE),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: PomoColors.PRIMARY_GREY,
            height: 2,
          ),
          labelStyle: const TextStyle(
            color: PomoColors.PRIMARY_WHITE,
          ),
          errorStyle: GoogleFonts.roboto(
            textStyle: const TextStyle(color: PomoColors.PRIMARY_WHITE),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? PomoColors.PRIMARY_WHITE),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: PomoColors.PRIMARY_WHITE),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: borderColor ?? PomoColors.PRIMARY_GREY),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: PomoColors.PRIMARY_GREY),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(() {});
  }
}
