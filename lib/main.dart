import 'package:cafeteria_app/screens/login_screen.dart';
import 'package:cafeteria_app/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute:
          (settings) => switch (settings.name) {
            "/" => MaterialPageRoute(builder: (context) => LoginScreen()),
            "/register" => MaterialPageRoute(
              builder: (context) => RegisterScreen(),
            ),
            _ => MaterialPageRoute(builder: (context) => LoginScreen()),
          },
    );
  }
}
