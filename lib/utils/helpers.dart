import 'package:cafeteria_app/main.dart' show scaffoldMessengerKey;
import 'package:flutter/material.dart';

void showGlobalSnackBar(String message) {
  scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(content: Text(message)),
  );
}
