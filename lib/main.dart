import 'package:cafeteria_app/providers/auth_provider.dart';
import 'package:cafeteria_app/screens/home_screen.dart';
import 'package:cafeteria_app/screens/login_screen.dart';
import 'package:cafeteria_app/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: const MyApp(),
    ),
  );
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
            "/" => MaterialPageRoute(builder: (_) => LoginScreen()),
            "/register" => MaterialPageRoute(builder: (_) => RegisterScreen()),
            "/home" => MaterialPageRoute(builder: (_) => HomeScreen()),
            _ => MaterialPageRoute(builder: (_) => LoginScreen()),
          },
    );
  }
}
