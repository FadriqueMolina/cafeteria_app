import 'package:cafeteria_app/business/providers/auth_provider.dart';
import 'package:cafeteria_app/presentation/screens/authentication/register_screen.dart';
import 'package:cafeteria_app/core/constants/strings.dart';
import 'package:cafeteria_app/core/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cafeteria_app/core/utils/helpers.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text(AppStrings.loginTitle))),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icono de cafeteria (Proximamente lo cambiare a uno animado )
              const Icon(Icons.coffee, color: Colors.brown, size: 100),
              const SizedBox(height: 20),
              //Correo
              MyTextfield(
                labelText: AppStrings.emailHint,
                isObscured: false,
                textController: _emailController,
                validator: (emailText) {
                  if (emailText == null || emailText.isEmpty) {
                    return AppStrings.mustEnterValidEmail;
                  }
                  if (!EmailValidator.validate(emailText)) {
                    // Validar el correo
                    return "Por favor, ingresa un correo electrónico válido.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
              //Boton iniciar sesion o indicador de progreso
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return Column(
                    children: [
                      if (authProvider.isLoading)
                        const CircularProgressIndicator()
                      else
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              String email = _emailController.text;
                              String passsword = _passwordController.text;
                              await authProvider.login(email, passsword);
                              if (authProvider.isAuthenticated) {
                                _emailController.clear();
                                _passwordController.clear();
                              } else {
                                showGlobalSnackBar(authProvider.errorMessage);
                              }
                            }
                          },
                          child: const Text(AppStrings.loginButton),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              //Texto registrarse
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: const Text(AppStrings.noAccount),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
