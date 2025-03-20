import 'package:cafeteria_app/utils/strings.dart';
import 'package:cafeteria_app/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text(AppStrings.registerTitle)),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icono de cafeteria
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
              //Confirmar contraseña
              MyTextfield(
                labelText: AppStrings.confirmPasswordHint,
                isObscured: true,
                textController: _confirmPasswordController,
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
                  if (_passwordController.text ==
                      _confirmPasswordController.text) {
                    if (_formKey.currentState!.validate()) {}
                  } else {
                    showSnackBar(context, AppStrings.passwordError);
                  }
                },
                child: Text(AppStrings.registerButton),
              ),
              SizedBox(height: 20),
              //Texto registrarse
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppStrings.haveAccount),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
