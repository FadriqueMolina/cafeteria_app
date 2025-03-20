import 'package:cafeteria_app/utils/strings.dart';
import 'package:cafeteria_app/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(AppStrings.loginTitle))),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icono de cafeteria (Proximamente lo cambiare a uno animado )
            Icon(Icons.coffee, color: Colors.brown, size: 100),
            SizedBox(height: 20),
            //Correo
            MyTextfield(
              labelText: AppStrings.emailHint,
              isObscured: false,
              textController: _emailController,
            ),
            SizedBox(height: 20),
            //Contraseña
            MyTextfield(
              labelText: AppStrings.passwordHint,
              isObscured: true,
              textController: _passwordController,
            ),
            SizedBox(height: 20),
            //Boton iniciar sesion
            ElevatedButton(
              onPressed: () {
                print("Username: ${_emailController.text}");
                print("Password: ${_passwordController.text}");
              },
              child: Text(AppStrings.loginButton),
            ),
            SizedBox(height: 20),
            //Texto registrarse
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/register");
              },
              child: Text(AppStrings.noAccount),
            ),
          ],
        ),
      ),
    );
  }
}
