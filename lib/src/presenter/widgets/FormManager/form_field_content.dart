import 'package:flutter/material.dart';

import '../FormField/field_type.dart';

class FormFieldContent {
  final TextEditingController controller = TextEditingController();
  final String labelText;
  final String hintText;
  final FieldType fieldType;
  bool isEnabled;

  FormFieldContent({
    required this.labelText,
    required this.hintText,
    this.fieldType = FieldType.generic,
    this.isEnabled = true,
  });
}
