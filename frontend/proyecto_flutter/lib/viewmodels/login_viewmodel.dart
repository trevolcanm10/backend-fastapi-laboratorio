import 'package:flutter/material.dart';
import '../repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository repo = AuthRepository();

  bool isLoading = false;
  bool isAuthenticated = false;
  String? errorMessage;

  Future<void> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      isAuthenticated = await repo.login(email, password);
      if (!isAuthenticated) {
        errorMessage = 'Credenciales incorrectas';
      }
    } catch (e) {
      isAuthenticated = false;
      errorMessage = 'Error: ${e.toString().length > 100 ? e.toString().substring(0, 100) : e.toString()}';
      print('Login error detallado: $e');
      print('Tipo de error: ${e.runtimeType}');
    }

    isLoading = false;
    notifyListeners();
  }
}