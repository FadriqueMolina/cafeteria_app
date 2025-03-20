import 'package:cafeteria_app/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Iniciar sesion"))),
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
              labelText: "Correo electronico",
              textController: _emailController,
            ),
            SizedBox(height: 20),
            //Contraseña
            MyTextfield(
              labelText: "Contraseña",
              textController: _passwordController,
            ),
            SizedBox(height: 20),
            //Boton iniciar sesion
            ElevatedButton(
              onPressed: () {
                print("Username: ${_emailController.text}");
                print("Password: ${_passwordController.text}");
              },
              child: Text("Iniciar sesion"),
            ),
            SizedBox(height: 20),
            //Texto registrarse
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/register");
              },
              child: Text("¿No tienes una cuenta? Regístrate"),
            ),
          ],
        ),
      ),
    );
  }
}
