import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController textController;
  const MyTextfield({
    super.key,
    required this.labelText,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
