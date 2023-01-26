import 'package:flutter/material.dart';

class FormFieldContent {
  final String labelText;
  final String hintText;
  final TextEditingController controller = TextEditingController();
  bool isEnabled;

  FormFieldContent({
    required this.labelText,
    required this.hintText,
    this.isEnabled = true,
  });
}
