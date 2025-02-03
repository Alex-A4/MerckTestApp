import 'package:flutter/material.dart';
import 'package:merck_test_app/const/const.dart';

/// Custom wrapper for TextField with decoration
class TextInput extends StatelessWidget {
  const TextInput({
    this.controller,
    this.focus,
    this.hintText,
    this.validator,
    this.labelText,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focus;

  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focus,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: Sizes.defaultBorderRadius,
        ),
      ),
    );
  }
}
