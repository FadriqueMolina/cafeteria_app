import 'package:cafeteria_app/providers/auth_provider.dart';
import 'package:cafeteria_app/utils/strings.dart';
import 'package:cafeteria_app/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return Scaffold(
          appBar: AppBar(title: Center(child: Text(AppStrings.loginTitle))),
          body: Form(
            key: _formKey,
            child: Padding(
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
                    validator: (emailText) {
                      if (emailText == null || emailText.isEmpty) {
                        return AppStrings.mustEnterValidEmail;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  //Contraseña
                  MyTextfield(
                    labelText: AppStrings.passwordHint,
                    isObscured: true,
                    textController: _passwordController,
                    validator: (passwordText) {
                      if (passwordText == null || passwordText.isEmpty) {
                        return AppStrings.mustEnterValidPassword;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  //Boton iniciar sesion
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authProvider.login();
                        Navigator.pushReplacementNamed(context, "/home");
                      }
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
          ),
        );
      },
    );
  }
}
