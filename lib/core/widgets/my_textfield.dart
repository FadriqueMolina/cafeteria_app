import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final bool isObscured;
  final String? Function(String?)? validator;
  const MyTextfield({
    super.key,
    required this.labelText,
    required this.textController,
    required this.isObscured,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: isObscured,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      validator: validator,
    );
  }
}
