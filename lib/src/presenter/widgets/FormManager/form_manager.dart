import 'package:flutter/material.dart';

import '../../../utils/pair.dart';
import '../FormField/custom_form_field.dart';
import 'form_field_content.dart';

class FormManager {
  final GlobalKey<FormState> formKey;
  final Map<String, FormFieldContent> formContent;
  final Color? textColor;
  final Color? borderColor;

  FormManager({
    required this.formKey,
    required this.formContent,
    this.textColor,
    this.borderColor,
  });

  get controller => formContent;
  get key => formKey;

  void addListener(Function() method) {
    formContent.forEach((_, form) => form.controller.addListener(method));
  }

  void addListenerByController(String controllerName, Function() method) {
    if (formContent.containsKey(controllerName)) {
      formContent[controllerName]!.controller.addListener(method);
    }
  }

  void disposeControllers() {
    formContent.forEach((_, form) => form.controller.dispose());
  }

  bool isValid() {
    if (formKey.currentState == null) return false;
    return formKey.currentState!.validate() && areControllersNotEmpty();
  }

  void clearForms() {
    formKey.currentState!.reset();
  }

  Map<String, String> data() {
    final data = <String, String>{};
    formContent.forEach((key, form) {
      data.putIfAbsent(key, () => form.controller.text);
    });
    return data;
  }

  bool areControllersNotEmpty() {
    for (final form in formContent.values) {
      if (form.controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void fillFields(Map<String, String> formValues) {
    formValues.forEach((key, value) {
      fillFieldIfAvailable(Pair(key, value));
    });
  }

  void fillFieldIfAvailable(Pair<String, String> field) {
    final fieldId = field.left;
    final fieldContent = field.right;

    if (formContent.containsKey(fieldId)) {
      formContent[fieldId]!.controller.text = fieldContent;
    }
  }

  void lockFields(List<String> fieldsId) {
    for (String fieldId in fieldsId) {
      if (formContent.containsKey(fieldId)) {
        formContent[fieldId]!.isEnabled = false;
      }
    }
  }

  Form buildForms() {
    return Form(
      key: formKey,
      child: _getFormFields(),
    );
  }

  Column _getFormFields() {
    final formFields = <CustomFormField>[];

    formContent.forEach((_, form) {
      formFields.add(
        CustomFormField(
          controller: form.controller,
          hintText: form.hintText,
          labelText: form.labelText,
          textColor: textColor,
          borderColor: borderColor,
          fieldType: form.fieldType,
          isRequiredField: form.isRequired,
        ),
      );
    });

    return Column(children: formFields);
  }
}
