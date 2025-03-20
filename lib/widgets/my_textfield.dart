import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  final bool isObscured;
  const MyTextfield({
    super.key,
    required this.labelText,
    required this.textController,
    required this.isObscured,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      obscureText: isObscured,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
