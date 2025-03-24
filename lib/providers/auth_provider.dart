import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _auth.currentUser != null;
  String get errorMessage => _errorMessage;

  AuthProvider() {
    //Llamar al stream que escucha por los cambios en FirebaseAuth y notificar a la UI por estos cambios
    _auth.authStateChanges().listen((_) {
      notifyListeners();
    });
  }

  Future<void> login(String email, String password) async {
    _errorMessage = "";
    _isLoading = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _errorMessage = _getErrorMessage(e.code);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(String email, String password) async {
    _errorMessage = "";
    _isLoading = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _errorMessage = _getErrorMessage(e.code);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return "El correo electrónico ya está registrado.";
      case 'weak-password':
        return "La contraseña debe tener al menos 6 caracteres.";
      case 'invalid-email':
        return "El correo electrónico no es válido.";
      case 'wrong-password':
        return "Correo electrónico o contraseña incorrectos.";
      case 'user-not-found':
        return "No existe una cuenta con este correo electrónico.";
      case "invalid-credential":
        return "Informancion no valida, por favor verifica tu usuario o password.";
      default:
        return "Ocurrió un error inesperado. Inténtalo de nuevo.";
    }
  }
}
