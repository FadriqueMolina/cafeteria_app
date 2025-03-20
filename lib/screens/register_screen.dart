import 'package:cafeteria_app/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Registro"))),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Icono de cafeteria
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
            //Confirmar contraseña
            MyTextfield(
              labelText: "Confirmar contraseña",
              textController: _confirmPasswordController,
            ),
            SizedBox(height: 20),
            //Boton iniciar sesion
            ElevatedButton(
              onPressed: () {
                if (_passwordController.text ==
                    _confirmPasswordController.text) {
                  print("Username: ${_emailController.text}");
                  print("Password: ${_passwordController.text}");
                } else {
                  print("Las contraseñas no coinciden");
                }
              },
              child: Text("Iniciar sesion"),
            ),
            SizedBox(height: 20),
            //Texto registrarse
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("¿Ya tienes una cuenta? Inicia sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
