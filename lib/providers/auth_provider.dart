import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isAuthenticated = false;
  String _errorMessage = "";
  final User? _user = FirebaseAuth.instance.currentUser;

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  String get errorMessage => _errorMessage;
  String get userName => _user?.displayName?.toString() ?? "";

  AuthProvider() {
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    _isLoading = false;
    notifyListeners();

    if (_user != null) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }
    _isLoading = false;
    notifyListeners();
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
      _isAuthenticated = true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _getErrorMessage(e.code);
      _isAuthenticated = false;
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
      _isAuthenticated = true;
    } on FirebaseAuthException catch (e) {
      _errorMessage = _getErrorMessage(e.code);
      _isAuthenticated = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    _isAuthenticated = false;
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
