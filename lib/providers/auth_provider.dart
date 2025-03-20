import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isAuthenticated = false;
  String _errorMessage = "";

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  String get errorMessage => _errorMessage;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _isAuthenticated = true;
      _errorMessage = "";
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message ?? "Error al iniciar sesion";
      _isAuthenticated = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(String email, String password) async {
    _isLoading = true;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _isAuthenticated = true;
      _errorMessage = "";
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message ?? "Error al registrar al usuario";
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
}
