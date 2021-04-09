import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String) validator;
  final Function(String) onChanged;
  TextEditingController controller;
  List<TextInputFormatter> inputFormatters;
  CustomTextFormField(
      {this.labelText,
      this.textInputType,
      this.controller,
      this.validator,
      this.inputFormatters,
      this.onChanged,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      obscureText: this.obscureText,
      keyboardType: this.textInputType,
      decoration: InputDecoration(isDense: true, labelText: this.labelText),
      validator: this.validator,
      onChanged: this.onChanged,
      inputFormatters: this.inputFormatters,
    );
  }
}
